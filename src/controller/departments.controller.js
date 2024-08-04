const DepartmentService = require("../service/department.service")
class DepartmentController {
    constructor() { }
    async getDepartmentsList(ctx, next) {
        const queryDepartmentdata = ctx.request.body;
        const res = await DepartmentService.getDepartmentList(queryDepartmentdata);
        ctx.body = {
            code: 200,
            message: "查询成功！",
            totalCount: res.totalCount, // 总数从 res.totalCount 获取
            data: res.data // 数据列表从 res.data 获取
        };
        console.log(res);
    }

    async createDepartment(ctx, next) {
        const departmentData = ctx.request.body
        const res = await DepartmentService.createDepartment(departmentData)
        if (res.affectedRows === 1) {
            ctx.body = {
                code: 200,
                message: "创建成功！",
                data: res,
            }
        }
    }
    async deleteDepartment(ctx, next) {
        const departmentId = ctx.params.id
        const res = await DepartmentService.deleteDepartment(departmentId)
        if (res.affectedRows === 1) {
            ctx.body = {
                code: 200,
                message: "删除成功！",
                data: res,
            }
        }
    }
    async patchDepartment(ctx, next) {
        const departmentData = ctx.request.body
        const departmentId = ctx.params.id
        const res = await DepartmentService.patchDepartment(departmentData, departmentId)
        if (res.affectedRows === 1) {
            ctx.body = {
                code: 200,
                message: "更新成功！",
                data: res
            }
        }
    }
    async getDepartment(ctx, next) {
        const departmentId = ctx.params.id
        const res = await DepartmentService.getDepartment(departmentId)
        if (res) {
            ctx.body = {
                code: 200,
                message: "查询成功！",
                data: res
            }
        }
    }
}


module.exports = new DepartmentController();