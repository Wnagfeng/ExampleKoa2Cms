const errorTypes = require('../constants/error-types');
const verifyUser = async (ctx, next) => {
    console.log("进入了verifyUser中间件")
    // 1.获取用户名和密码
    const { name, password } = ctx.request.body;
    // 2.判断用户名或者密码不能空
    if (!name || !password) {
        const error = new Error(errorTypes.NAME_OR_PASSWORD_IS_REQUIRED);
        return ctx.app.emit('error', error, ctx);
    }
    await next();
}
module.exports = {
    verifyUser
}
