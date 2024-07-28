const RoleService = require('../service/role.service');
const errorTypes = require('../constants/error-types');
const VerftRoleName = async (ctx, next) => {
    const name = ctx.request.body.name
    const res = await RoleService.GetRoleForname(name)
    if (res.length > 0) {
        const error = new Error(errorTypes.ROLE_NAME_EXISTS);
        return ctx.app.emit('error', error, ctx)
    }
    await next()
}
module.exports = {
    VerftRoleName
}