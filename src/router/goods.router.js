const Router = require('koa-router');
const Goods = new Router();
const { getCount, getCategorySale, getFavor, getTop10, getAmountList, getAddressSale } = require('../controller/goods.controller')
const { verifyAuth } = require('../middleware/user.middleware')
Goods.get('/goods/category/count', verifyAuth, getCount);
Goods.get("/goods/category/sale", verifyAuth, getCategorySale);
Goods.get("/goods/category/favor", verifyAuth, getFavor)
Goods.get("/goods/sale/top10", verifyAuth, getTop10)
Goods.get("/goods/address/sale", verifyAuth, getAmountList)
Goods.get("/goods/amount/list", verifyAuth, getAddressSale)
module.exports = Goods;