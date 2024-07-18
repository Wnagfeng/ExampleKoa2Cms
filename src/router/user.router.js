const Router = require('koa-router');
const home = new Router({ prefix: '/user' });
const { getUserList } = require("../controller/user.controller")
const { verifyUser } = require('../middleware/user.middleware')
home.get('/test', verifyUser, getUserList);
module.exports = home;