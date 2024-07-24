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
}

module.exports = new GoodsController();
