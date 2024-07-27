const Router = require('koa-router');
const Menu = new Router();
const { createMenu, deleteMenu, patchMenu, getMenu ,getMenuList} = require("../controller/menu.controller")
const { verifyAuth } = require('../middleware/user.middleware')
const { VerifyMenuName, VerifyMenuUrl } = require("../middleware/menu.middleware")
Menu.post('/menu', verifyAuth, VerifyMenuName, VerifyMenuUrl, createMenu)
Menu.delete('/menu/:id', verifyAuth, deleteMenu)
Menu.patch("/menu/:id", verifyAuth, patchMenu)
Menu.get('/menu/:id', verifyAuth, getMenu)
Menu.get("/menu", verifyAuth, getMenuList)
module.exports = Menu;