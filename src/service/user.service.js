
const conn = require('../app/database');

class UserService {
    constructor() {
    }

    async getUserByName(name) {
        const statement = 'SELECT * FROM `users` WHERE username = ?;';
        const [result] = await conn.execute(statement, [name]);
        return result;
    }

    async registerUser(user) {
        const { username, password, salt } = user;
        const statement = 'INSERT INTO `users` (username, Password,salt) VALUES (?, ?,?);';
        const [result] = await conn.execute(statement, [username, password, salt]);
        return result;
    }

    async getUserSaltByName(name) {
        const statement = 'SELECT salt FROM `users` WHERE username = ?;';
        const [result] = await conn.execute(statement, [name]);
        return result[0].salt;
    }
    async getUserList(queryData) {
        const { offset, size, name, cellphone } = queryData;

        // 构建查询条件
        let baseStatement = `
            SELECT 
                u.userid,
                u.username,
                u.roleid,
                u.cellphone,
                u.state,
                u.departmentid,
                u.created_at,
                u.updated_at,
                u.realname,
                d.name AS department_name,
                r.name AS role_name
            FROM users u
            LEFT JOIN department d ON u.departmentid = d.id
            LEFT JOIN role r ON u.roleid = r.id
        `;

        const conditions = [];
        const parameters = [];

        if (name) {
            conditions.push('u.username = ?');
            parameters.push(name);
        }
        if (cellphone) {
            conditions.push('u.cellphone LIKE ?');
            parameters.push(`%${cellphone}%`);
        }
        if (conditions.length > 0) {
            baseStatement += 'WHERE ' + conditions.join(' AND ') + ' ';
        }

        // 1. 查询总记录数
        const countStatement = `SELECT COUNT(*) AS total FROM (${baseStatement}) AS countQuery`;

        // 2. 查询分页数据
        let dataStatement = baseStatement;
        if (typeof size !== 'undefined' || typeof offset !== 'undefined') {
            dataStatement += `LIMIT ${size || 10} OFFSET ${offset || 0}`;
        }

        try {
            // 执行查询总记录数
            const [countRows] = await conn.execute(countStatement, parameters);
            const totalCount = countRows[0].total;

            // 执行分页数据查询
            const [dataRows] = await conn.execute(dataStatement, parameters);
        
            // 返回结果包含数据和总记录数
            return {
                totalCount,
                data: dataRows
            };
        } catch (error) {
            console.error('Error in getUserList:', error);
            throw error;
        }
    }




    async createUser(userData) {
        // 插入数据库
        const { username, realname, password, cellphone, departmentid, roleid, salt } = userData;
        // 对密码进行加密
        console.log("userData", userData)
        const statement = 'INSERT INTO `users` (username, realname, password, cellphone, departmentid, roleid,salt) VALUES (?,?,?,?,?,?,?);';
        const [result] = await conn.execute(statement, [username, realname, password, cellphone, departmentid, roleid, salt]);
        return result;
    }
    async deleteUser(id) {
        const statement = 'DELETE FROM `users` WHERE userid = ?;';
        const [result] = await conn.execute(statement, [id]);
        return result;
    }
    async patchUser(id, userData) {
        let res = [];
        for (const item in userData) {
            const statement = `UPDATE users SET ${item} = ? WHERE userid = ?;`;
            const [result] = await conn.query(statement, [userData[item], id]);
            res = result;
        }
        return res;

    }



}

module.exports = new UserService();
