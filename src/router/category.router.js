const Router = require('koa-router');
const { verifyAuth } = require('../middleware/user.middleware');
const { createCategorie, deleteCategorie, patchCategrie ,getCategories,getCategoriesList} = require("../controller/categorie.controller")
const { verifyCategorieName } = require("../middleware/categorie.middleware")
const Category = new Router();
Category.post('/categorie', verifyAuth, verifyCategorieName, createCategorie);
Category.delete("/categorie/:id", verifyAuth, deleteCategorie)
Category.patch("/categorie/:id", verifyAuth, patchCategrie)
Category.get("/categorie/list",verifyAuth,getCategoriesList)
Category.get("/categorie/:id",verifyAuth,getCategories)







module.exports = Category;