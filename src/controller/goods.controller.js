const GoodsService = require("../service/goods.service");

class GoodsController {
    async getCount(ctx, next) {
        const res = await GoodsService.getCount();
        ctx.body = {
            code: 200,
            message: "查询成功！",
            data: res,
        };
    }

    async getCategorySale(ctx, next) {
        const res = await GoodsService.getCategorySale();
        ctx.body = {
            code: 200,
            message: "查询成功！",
            data: res,
        };
    }

    async getFavor(ctx, next) {
        const res = await GoodsService.getFavor();
        ctx.body = {
            code: 200,
            message: "查询成功！",
            data: res,
        };
    }

    async getTop10(ctx, next) {
        const res = await GoodsService.getTop10();
        ctx.body = {
            code: 200,
            message: "查询成功！",
            data: res,
        };
    }

    async getAmountList(ctx, next) {
        const res = await GoodsService.getAmountList();
        ctx.body = {
            code: 200,
            message: "查询成功！",
            data: res,
        };
    }

    async getAddressSale(ctx, next) {
        const res = await GoodsService.getAddressSale();
        ctx.body = {
            code: 200,
            message: "查询成功！",
            data: res,
        };
    }
    async insertProducts(ctx, next) {
        const products = ctx.request.body.list;
        const res = await GoodsService.insertProducts(products);
        ctx.body = {
            code: 200,
            message: '插入成功！',
            data: res,
        };
    }
    async createProduct(ctx, next) {
        const product = ctx.request.body;
        const res = await GoodsService.createProduct(product);
        if (res.affectedRows === 1) {
            ctx.body = {
                code: 200,
                message: '创建成功！',
                data: res,
            }
        }
    }
    async patchProduct(ctx, next) {
        const product = ctx.request.body;
        const id = ctx.params.id;
        const res = await GoodsService.patchProduct(product, id);
        if (res.affectedRows === 1) {
            ctx.body = {
                code: 200,
                message: '更新成功！',
                data: res,
            }
        }
    }
    async deleteProduct(ctx, next) {
        const id = ctx.params.id;
        const res = await GoodsService.deleteProduct(id);
        if (res.affectedRows === 1) {
            ctx.body = {
                code: 200,
                message: '删除成功！',
                data: res,
            }
        }
    }
    async getProducy(ctx, next) {
        const id = ctx.params.id;
        const res = await GoodsService.getProduct(id);
        if (res) {
            ctx.body = {
                code: 200,
                message: '查询成功！',
                data: res,
            }
        }
    }
}

module.exports = new GoodsController();
