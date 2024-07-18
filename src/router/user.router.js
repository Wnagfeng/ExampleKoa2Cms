const Router = require('koa-router');
const User = new Router();
const { register } = require("../controller/user.controller")
const { verifyUser, handlePassword, verifyLogin, verifyAuth } = require('../middleware/user.middleware')
const { login, success } = require("../controller/auth.controller")
User.post("/register", verifyUser, handlePassword, register);
User.post('/login', verifyLogin, login);
User.post("/testlogin", verifyAuth, success)
module.exports = User;