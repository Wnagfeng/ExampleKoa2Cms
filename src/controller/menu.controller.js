const MenuService = require("../service/menu.service")
class MenuController {
    constructor() {

    }
    async createMenu(ctx, next) {
        const menuData = ctx.request.body;
        console.log(menuData)
        const res = await MenuService.createMenu(menuData)
        if (res.affectedRows === 1) {
            ctx.body = {
                code: 200,
                message: "创建成功"
            }
        }
    }
    async deleteMenu(ctx, next) {
        const id = ctx.params.id;
        const res = await MenuService.deleteMenu(id)
        if (res.affectedRows === 1) {
            ctx.body = {
                code: 200,
                message: "删除成功"
            }
        }
    }

    async patchMenu(ctx, next) {
        const id = ctx.params.id;
        const menuData = ctx.request.body;
        const res = await MenuService.patchMenu(id, menuData)
        if (res.affectedRows === 1) {
            ctx.body = {
                code: 200,
                message: "修改成功"
            }
        }
    }
    async getMenu(ctx, next) {
        const id = ctx.params.id;
        const res = await MenuService.getMenu(id)
        if (res.length > 0) {
            ctx.body = {
                code: 200,
                data: res[0]
            }
        }
    }
    async getMenuList(ctx, next) {
        const res = await MenuService.getMenuList()
        if (res.length > 0) {
            ctx.body = {
                code: 200,
                data: res
            }
        }

    }
}
module.exports = new MenuController();