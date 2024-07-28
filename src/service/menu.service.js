const conn = require('../app/database');
class MenuService {
    constructor() {

    }
    async createMenu(menuData) {
        const { name, type, url, sort, parentId } = menuData;
        const sql = `INSERT INTO menu (name, type, url, sort, parentid) VALUES (?,?,?,?,?)`;
        const params = [name, type, url, sort, parentId];
        try {
            const [result] = await conn.execute(sql, params);
            return result;
        } catch (error) {
            console.log(error);
            return null;
        }
    }
    async getMenuforName(name) {
        const sql = `SELECT * FROM menu WHERE name = ?`;
        const params = [name];
        try {
            const [result] = await conn.execute(sql, params);
            return result;
        } catch (error) {
            console.log(error);
            return null;
        }
    }
    async getMenuforUrl(url) {
        const sql = `SELECT * FROM menu WHERE url = ?`;
        const params = [url];
        try {
            const [result] = await conn.execute(sql, params);
            return result;
        } catch (error) {
            console.log(error);
            return null;
        }

    }
    async deleteMenu(id) {
        const sql = `DELETE FROM menu WHERE id = ?`;
        const params = [id];
        try {
            const [result] = await conn.execute(sql, params);
            return result;
        } catch (error) {
            console.log(error);
            return null;
        }
    }
    async patchMenu(id, menuData) {
        const { name, type, url, sort, parentId } = menuData;
        const sql = `UPDATE menu SET name = ?, type = ?, url = ?, sort = ?, parentid = ? WHERE id = ?`;
        const params = [name, type, url, sort, parentId, id];
        try {
            const [result] = await conn.execute(sql, params);
            return result;
        } catch (error) {
            console.log(error);
            return null;
        }
    }
    async getMenu(id) {
        const sql = `SELECT * FROM menu WHERE id = ?`;
        const params = [id];
        try {
            const [result] = await conn.execute(sql, params);
            return result;
        } catch (error) {
            console.log(error);
            return null;
        }
    }
    async getMenuList() {
        const sql = `
SELECT 
    m1.id id, 
    m1.name name, 
    m1.type type, 
    m1.url url, 
    m1.icon icon, 
    m1.sort sort, 
    m1.createAt createAt, 
    m1.updateAt updateAt,
    
    (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                "id", m2.id,
                "name", m2.name,
                "type", m2.type,
                "parentId", m2.parentId,
                "url", m2.url,
                "sort", m2.sort,
                "createAt", m2.createAt,
                "updateAt", m2.updateAt,
                "children", (
                    SELECT JSON_ARRAYAGG(
                        JSON_OBJECT(
                            "id", m3.id,
                            "name", m3.name,
                            "type", m3.type,
                            "parentId", m3.parentId,
                            "url", m3.url,
                            "sort", m3.sort,
                            "permission", m3.permission,
                            "createAt", m3.createAt,
                            "updateAt", m3.updateAt
                        )
                    )
                    FROM menu m3
                    WHERE m3.parentId = m2.id
                    ORDER BY m3.sort
                )
            )
        )
        FROM menu m2
        WHERE m1.id = m2.parentId
        ORDER BY m2.sort
    ) children
FROM menu m1
WHERE m1.type = 1;

`;
        try {
            const [result] = await conn.execute(sql);
            return result;
        } catch (error) {
            console.log(error);
            return null;
        }
    }

}
module.exports = new MenuService();