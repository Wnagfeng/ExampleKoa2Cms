const jwt = require('jsonwebtoken');
const errorTypes = require('../constants/error-types');
const userService = require("../service/user.service")
const { generateSalt, md5password } = require("../utils/password-handle")
const { PUBLIC_KEY, WEB_PRIVATE_KEY } = require('../app/config');
const { decrypt } = require("../utils/rsa")
const verifyUser = async (ctx, next) => {
   
    const { username, password } = ctx.request.body;
    if (!username || !password) {
        const error = new Error(errorTypes.NAME_OR_PASSWORD_IS_REQUIRED);
        return ctx.app.emit('error', error, ctx);
    }
    const users = await userService.getUserByName(username)
    if (users.length) {
        const error = new Error(errorTypes.USER_ALREADY_EXISTS);
        return ctx.app.emit('error', error, ctx)
    }
    await next();
}
// 处理密码的middleware~
const handlePassword = async (ctx, next) => {
    const { password } = ctx.request.body;
    // 获取一个盐值
    const salt = generateSalt();
    // 加密密码
    ctx.request.body.password = md5password(password, salt)
    ctx.request.body.salt = salt
    await next();
}
// 验证登录的middleware~
const verifyLogin = async (ctx, next) => {
    // 1.获取用户名和密码
    const { username, password } = ctx.request.body;

    // 2.判断用户名和密码是否为空
    if (!username || !password) {
        const error = new Error(errorTypes.NAME_OR_PASSWORD_IS_REQUIRED);
        return ctx.app.emit('error', error, ctx);
    }

    // 3.判断用户是否存在的
    const result = await userService.getUserByName(username);
    const user = result[0];
    if (!user) {
        const error = new Error(errorTypes.USER_DOES_NOT_EXISTS);
        return ctx.app.emit('error', error, ctx);
    }
    // 4.对前端传递的密码进行解密
    const DecryptPassword = decrypt(password, WEB_PRIVATE_KEY)
    const salt = await userService.getUserSaltByName(username)
    if (md5password(DecryptPassword, salt) !== user.password) {
        const error = new Error(errorTypes.PASSWORD_IS_INCORRENT);
        return ctx.app.emit('error', error, ctx);
    }
    ctx.user = user;
    await next();
}
// 验证授权的middleware~
const verifyAuth = async (ctx, next) => {
    // 1.获取token
    const authorization = ctx.headers.authorization;
    if (!authorization) {
        const error = new Error(errorTypes.UNAUTHORIZATION);
        return ctx.app.emit('error', error, ctx);
    }
    const token = authorization.replace('Bearer ', '');
    // 2.验证token(id/name/iat/exp)
    try {
        const result = jwt.verify(token, PUBLIC_KEY, {
            algorithms: ["RS256"]
        });
        ctx.user = result;
        await next();
    } catch (err) {
        const error = new Error(errorTypes.UNAUTHORIZATION);
        ctx.app.emit('error', error, ctx);
    }
}
// 验证用户名是否存在的middleware~
const verifyUsername = async (ctx, next) => {
    // 1.获取用户名和密码
    const { username, password } = ctx.request.body;
    // 2.判断用户名和密码是否为空
    if (!username || !password) {
        const error = new Error(errorTypes.NAME_OR_PASSWORD_IS_REQUIRED);
        return ctx.app.emit('error', error, ctx);
    }
    // 3.判断用户是否存在的
    const result = await userService.getUserByName(username);
    const user = result[0];
    if (user) {
        const error = new Error(errorTypes.USER_ALREADY_EXISTS);
        return ctx.app.emit('error', error, ctx);
    }
    ctx.user = user;
    await next();
}
module.exports = {
    verifyUser,
    handlePassword,
    verifyLogin,
    verifyAuth,
    verifyUsername
}
