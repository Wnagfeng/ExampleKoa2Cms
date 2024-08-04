const conn = require('../app/database');
class CategorieService {
    constructor() { }
    async getcategoieforName(name) {
        const sql = `SELECT * FROM categories WHERE name =?`;
        const result = await conn.query(sql, [name]);
        return result[0];
    }
    async createcategoie(name) {
        const sql = `INSERT INTO categories (name) VALUES (?)`;
        const result = await conn.query(sql, [name]);
        return result;
    }
    async deleteCategorie(id) {
        const sql = `DELETE FROM categories WHERE id = ?`;
        const result = await conn.query(sql, [id]);
        return result;
    }
    async patchCategrie(id, name) {
        const sql = `UPDATE categories SET name = ? WHERE id = ?`;
        const result = await conn.query(sql, [name, id]);
        return result;
    }
    async getCategories(id) {
        const sql = `SELECT * FROM categories WHERE id = ?`;
        const result = await conn.query(sql, [id]);
        return result[0];
    }
    async getCategoriesList() {
        // 1. 查询所有分类数据
        const dataQuery = `SELECT * FROM categories`;
        const [dataRows] = await conn.query(dataQuery);

        // 2. 查询分类表的总数
        const countQuery = `SELECT COUNT(*) AS total FROM categories`;
        const [countRows] = await conn.query(countQuery);
        const totalCount = countRows[0].total;

        // 3. 返回包含数据和总数的结果
        return {
            totalCount,
            data: dataRows
        };
    }

}
module.exports = new CategorieService();