const Router = require('koa-router');
const Goods = new Router();
const { getCount, getCategorySale, getFavor, getTop10, getAmountList, getAddressSale, insertProducts, createProduct, patchProduct, deleteProduct, getProducy, getProducyList } = require('../controller/goods.controller')
const { verifyAuth } = require('../middleware/user.middleware')
// 商品图表数据
Goods.get('/goods/category/count', verifyAuth, getCount);
Goods.get("/goods/category/sale", verifyAuth, getCategorySale);
Goods.get("/goods/category/favor", verifyAuth, getFavor)
Goods.get("/goods/sale/top10", verifyAuth, getTop10)
Goods.get("/goods/address/sale", verifyAuth, getAddressSale)
Goods.get("/goods/amount/list", verifyAuth, getAmountList)
// 商品信息
Goods.post('/goods/insert', insertProducts);// 批量插入数据用(别轻易调用除非products中没有数据)
Goods.post('/goods', verifyAuth, createProduct); // 创建商品
Goods.patch('/goods/:id', verifyAuth, patchProduct); // 更新商品
Goods.delete('/goods/:id', verifyAuth, deleteProduct); // 删除商品
Goods.get('/goods/:id', verifyAuth, getProducy); // 获取单个商品信息
Goods.get("/goods/list", verifyAuth, getProducyList); // 获取商品列表

module.exports = Goods;