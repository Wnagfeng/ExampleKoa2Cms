const conn = require('../app/database');
const formatDate = require("../utils/formatDate")
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

    async insertProducts(products) {
        if (products.length === 0) return; // 如果没有数据，直接返回

        // 准备数据
        const values = products.map(product => [
            product.id,
            product.name,
            product.oldPrice,
            product.newPrice,
            product.desc,
            product.status,
            product.imgUrl,
            product.inventoryCount,
            product.saleCount,
            product.favorCount,
            product.address,
            product.categoryId,
            formatDate(product.createAt),
            formatDate(product.updateAt)
        ]);

        // 创建 SQL 插入语句
        const sql = `INSERT INTO products (id, name, oldPrice, newPrice, \`desc\`, status, imgUrl, inventoryCount, saleCount, favorCount, address, categoryId, createAt, updateAt) VALUES ?`;

        // 执行插入操作
        try {
            const [result] = await conn.query(sql, [values]);
            console.log("插入结果：", result);
        } catch (error) {
            console.error("插入失败：", error);
        }
    }

    async createProduct(products) {
        const { name, oldPrice, newPrice, desc, status, imgUrl, inventoryCount, saleCount, favorCount, address, categoryId, } = products;
        const sql = `INSERT INTO products (name, oldPrice, newPrice, \`desc\`, status, imgUrl, inventoryCount, saleCount, favorCount, address, categoryId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
        const values = [name, oldPrice, newPrice, desc, status, imgUrl, inventoryCount, saleCount, favorCount, address, categoryId];
        try {
            const [result] = await conn.query(sql, values);
            return result;
        } catch (error) {
            console.error("插入失败：", error);
            throw error;
        }
    }
    async patchProduct(productData, id) {
        const { name, oldPrice, newPrice, desc, status, imgUrl, inventoryCount, saleCount, favorCount, address, categoryId, createAt, updateAt } = productData;

        // 构建 SQL 更新语句
        let sql = `UPDATE products 
                   SET name = ?, oldPrice = ?, newPrice = ?, \`desc\` = ?, status = ?, imgUrl = ?, inventoryCount = ?, saleCount = ?, favorCount = ?, address = ?, categoryId = ?, createAt = ?, updateAt = ? 
                   WHERE id = ?`;

        // 执行 SQL 更新操作
        const [result] = await conn.query(sql, [name, oldPrice, newPrice, desc, status, imgUrl, inventoryCount, saleCount, favorCount, address, categoryId, createAt, updateAt, id]);

        return result;
    }
    async deleteProduct(id) {
        const sql = `DELETE FROM products WHERE id = ?`;
        const [result] = await conn.query(sql, [id]);
        return result;
    }
    async getProduct(id) {
        const sql = `SELECT * FROM products WHERE id = ?`;
        const [result] = await conn.query(sql, [id]);
        return result;
    }


}

module.exports = new GoodsService();
