const DepartmentService = require('../service/department.service')
const errorTypes = require('../constants/error-types');
// 判断部门名称是否存在的middleware~
const verifyDepartmentName = async (ctx, next) => {

    const departmentName = ctx.request.body.name
    const res = await DepartmentService.getDepartmentbyName(departmentName)
    if (res.length > 0) {
        const error = new Error(errorTypes.DEPARTMENT_NAME_EXISTS);
        return ctx.app.emit('error', error, ctx);
    }
    await next();
}
module.exports = {
    verifyDepartmentName
}