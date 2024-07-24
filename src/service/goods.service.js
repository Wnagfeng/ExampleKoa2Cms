const conn = require('../app/database');

class GoodsService {
    async getCount() {
        let sql = `SELECT id, name, goodsCount FROM categories`;
        const [result] = await conn.query(sql);
        return result;
    }

    async getCategorySale() {
        let sql = `SELECT id, name, goodsCount FROM inventory`;
        const [result] = await conn.query(sql);
        return result;
    }

    async getFavor() {
        let sql = `SELECT id, name, goodsFavor FROM favor`;
        const [result] = await conn.query(sql);
        return result;
    }

    async getTop10() {
        let sql = `SELECT id, name, saleCount FROM sales ORDER BY saleCount DESC LIMIT 10`;
        const [result] = await conn.query(sql);
        return result;
    }

    async getAmountList() {
        let sql = `SELECT amount, title, tips, subtitle, number1, number2 FROM summary`;
        const [result] = await conn.query(sql);
        return result;
    }

    async getAddressSale() {
        let sql = `SELECT address, count FROM city_sales`;
        const [result] = await conn.query(sql);
        return result;
    }
}

module.exports = new GoodsService();
