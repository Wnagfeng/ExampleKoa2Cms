
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
        let statement = 'SELECT * FROM `users` ';
        const conditions = [];
        if (name) {
            conditions.push(`username LIKE '%${name}%'`);
        }
        if (cellphone) {
            conditions.push(`Cellphone LIKE '%${cellphone}%'`);
        }
        if (conditions.length > 0) {
            statement += 'WHERE ' + conditions.join(' AND ') + ' ';
        }

        statement += `LIMIT ${size} OFFSET ${offset};`;

        const [result] = await conn.execute(statement);
        return result;
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
