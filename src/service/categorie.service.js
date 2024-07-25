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
        const sql = `SELECT * FROM categories`;
        const result = await conn.query(sql);
        return result;
    }
}
module.exports = new CategorieService();