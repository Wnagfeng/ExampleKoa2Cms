const MenuService = require('../service/menu.service');
const errorTypes = require('../constants/error-types');
const VerifyMenuName = async (ctx, next) => {
    const { name } = ctx.request.body;
    const menu = await MenuService.getMenuforName(name);
    if (menu.length) {
        const error = new Error(errorTypes.MENU_NAME_EXISTS);
        return ctx.app.emit('error', error, ctx)
    }
    await next();

}
const VerifyMenuUrl = async (ctx, next) => {
    const { url } = ctx.request.body;
    const menu = await MenuService.getMenuforUrl(url);
    if (menu.length) {
        const error = new Error(errorTypes.MENU_URL_EXISTS);
        return ctx.app.emit('error', error, ctx)
    }
    await next();

}
module.exports = {
    VerifyMenuName,
    VerifyMenuUrl
}