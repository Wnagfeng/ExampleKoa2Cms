const RoleService = require('../service/role.service');
class RoleController {
    constructor() { }
    async createRole(ctx, next) {
        const RoleData = ctx.request.body;
        const res = await RoleService.create(RoleData);
        ctx.body = {
            code: 200,
            res: res
        }
    }
    async deleteRole(ctx, next) {
        const id = ctx.params.id;
        const res = await RoleService.delete(id);
        ctx.body = {
            code: 200,
            message: '删除成功',
            res: res
        }

    }
    async getRoleList(ctx, next) {


        const quertData = ctx.request.body;
        const res = await RoleService.getRoleList(quertData);
        ctx.body = {
            code: 200,
            message: "查询成功！",
            totalCount: res.totalCount, // 总数从 res.totalCount 获取
            data: res.data // 数据列表从 res.data 获取
        }
    }
    async getRole(ctx, next) {
        const id = ctx.params.id;
        const res = await RoleService.getRole(id);
        ctx.body = {
            code: 200,
            res: res
        }
    }
    async getRoleAndMenu(ctx, next) {
        const id = ctx.params.id;
        const res = await RoleService.getRoleAndMenu(id);
        ctx.body = {
            code: 200,
            res: res,
            message: '获取角色菜单成功'
        }
    }
}
module.exports = new RoleController();