const Router = require('koa-router');
const User = new Router();
const { register, getUserlist, createUser, deleteUser, patchUser } = require("../controller/user.controller")
const { verifyUser, handlePassword, verifyLogin, verifyAuth, verifyUsername } = require('../middleware/user.middleware')
const { login, success } = require("../controller/auth.controller")
User.post("/register", verifyUser, handlePassword, register);
User.post('/login', verifyLogin, login);
User.get("/testlogin", verifyAuth, success);
User.post("/user/list", verifyAuth, getUserlist);
User.post("/user", verifyAuth, verifyUsername, handlePassword, createUser)
User.delete("/user/:id", verifyAuth, deleteUser)
User.patch("/user/:id", patchUser)
module.exports = User;