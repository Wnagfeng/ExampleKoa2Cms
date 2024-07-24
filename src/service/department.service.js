const conn = require('../app/database');
class DepartmentService {
    constructor() {

    }
    async getDepartmentList(queryDepartmentdata) {
        let { offset, size, name, leader } = queryDepartmentdata;
        let sql = `SELECT * FROM department WHERE 1=1 `;
        const values = [];
        if (name) {
            sql += `AND name LIKE ? `;
            values.push(`%${name}%`);
        }
        if (leader) {
            sql += `AND leader LIKE ? `;
            values.push(`%${leader}%`);
        }

        sql += `ORDER BY id `;

        if (offset !== undefined && size !== undefined) {
            sql += `LIMIT ? OFFSET ?`;
            values.push(size, offset);
        }

        const [result] = await conn.query(sql, values);
        return result;
    }
    async getDepartmentbyName(name) {
        let sql = `SELECT * FROM department WHERE name = ?`;
        const [result] = await conn.query(sql, [name]);
        return result;
    }
    async createDepartment(departmentData) {
        let { name, leader, parentId } = departmentData;
        let sql = `INSERT INTO department (name, leader, parentid) VALUES (?,?,?)`;
        const [result] = await conn.query(sql, [name, leader, parentId]);
        return result;
    }
    async deleteDepartment(id) {
        let sql = `DELETE FROM department WHERE id = ?`;
        const [result] = await conn.query(sql, [id]);
        return result;
    }
    async patchDepartment(departmentData, id) {
        let { name, leader, parentId } = departmentData;
        let sql = `UPDATE department SET name = ?, leader = ?, parentid = ? WHERE id = ?`;
        const [result] = await conn.query(sql, [name, leader, parentId, id]);
        return result;
    }
    async getDepartment(id) {
        // 需要更具id查询部门信息 然后根据部门中的parentid查询父部门信息 将父部门信息添加到部门信息中的parent字段中
        let sql = `SELECT * FROM department WHERE id = ?`;
        const [result] = await conn.query(sql, [id]);
        return result;
    }


}
module.exports = new DepartmentService();