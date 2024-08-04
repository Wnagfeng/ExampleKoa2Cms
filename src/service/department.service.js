const conn = require('../app/database');
class DepartmentService {
    constructor() {

    }
    async getDepartmentList(queryDepartmentdata) {
        let { offset, size, name, leader } = queryDepartmentdata;
        let sql;
        let params = [];

        // 1. Construct the base query for departments
        let baseStatement = `
            SELECT 
                d1.id, 
                d1.name, 
                d1.type, 
                d1.leader, 
                d1.parentid, 
                d1.createAt, 
                d1.updateAt, 
                d2.name AS parentName
            FROM 
                department d1
            LEFT JOIN 
                department d2 ON d1.parentid = d2.id
            WHERE 
                1=1
        `;

        // 2. Add query conditions
        if (name) {
            baseStatement += ` AND d1.name LIKE ?`;
            params.push(`%${name}%`);
        }
        if (leader) {
            baseStatement += ` AND d1.leader LIKE ?`;
            params.push(`%${leader}%`);
        }

        // 3. Create a statement to count total departments
        const countStatement = `SELECT COUNT(*) AS total FROM (${baseStatement}) AS countQuery`;

        // 4. Create a statement for pagination
        if (offset !== undefined && size !== undefined) {
            sql = `${baseStatement} ORDER BY d1.id LIMIT ? OFFSET ?`;
            params.push(size, offset);
        } else {
            sql = `${baseStatement} ORDER BY d1.id`;
        }

        try {
            // Execute the count query
            const [countRows] = await conn.query(countStatement, params);
            const totalCount = countRows[0].total;

            // Execute the paginated data query
            const [dataRows] = await conn.query(sql, params);

            // Return the result with total count and data
            return {
                totalCount,
                data: dataRows
            };
        } catch (error) {
            console.error('Error in getDepartmentList:', error);
            throw error;
        }
    }



    async getDepartmentbyName(name) {
        let sql = `SELECT * FROM department WHERE name = ?`;
        const [result] = await conn.query(sql, [name]);
        return result;
    }
    async createDepartment(departmentData) {
        let { name, leader, parentid } = departmentData;
        let sql = `INSERT INTO department (name, leader, parentid) VALUES (?,?,?)`;
        const [result] = await conn.query(sql, [name, leader, parentid]);
        return result;
    }
    async deleteDepartment(id) {
        let sql = `DELETE FROM department WHERE id = ?`;
        const [result] = await conn.query(sql, [id]);
        return result;
    }
    async patchDepartment(departmentData, id) {
        let { name, leader, parentid } = departmentData;
        let sql = `UPDATE department SET name = ?, leader = ?, parentid = ? WHERE id = ?`;
        const [result] = await conn.query(sql, [name, leader, parentid, id]);
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