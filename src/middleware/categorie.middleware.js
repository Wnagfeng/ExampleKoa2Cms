const categorieService = require("../service/categorie.service")
const errorTypes = require('../constants/error-types');
const verifyCategorieName = async (ctx, next) => {
    const categorieName = ctx.request.body.name
    const res = await categorieService.getcategoieforName(categorieName)
    if (res.length > 0) {
        const error = new Error(errorTypes.CATEGORIE_NAME_EXISTS);
        return ctx.app.emit('error', error, ctx);
    }
    await next()
}
module.exports = {
    verifyCategorieName
}