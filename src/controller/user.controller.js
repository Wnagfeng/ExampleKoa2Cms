const userService = require('../service/user.service');
const { generateSalt, md5password } = require("../utils/password-handle")
class UserController {
    constructor() { }
    async register(ctx, next) {
        const userdata = ctx.request.body;
        const res = await userService.registerUser(userdata)
        console.log(res)
        if (res.affectedRows == 1) {
            ctx.body = {
                code: 200,
                message: "创建用户成功！",
                data: res
            }
        } else {
            ctx.body = {
                message: "创建用户失败！",
                data: res
            }
        }
    }
    async getUserlist(ctx, next) {
        const queydata = ctx.request.body

        const res = await userService.getUserList(queydata)
        res.forEach(item => {
            delete item.password
            delete item.salt
        })
        return ctx.body = {
            code: 200,
            totalCount: res.length,
            message: "获取用户列表成功！",
            data: res
        }
    }
    async createUser(ctx, next) {
        const userdata = ctx.request.body;
        const res = await userService.createUser(userdata)
        if (res.affectedRows == 1) {
            ctx.body = {
                code: 200,
                message: "创建用户成功！",
                data: res

            }
        }


    }
    async deleteUser(ctx, next) {
        const { id } = ctx.params
        const res = await userService.deleteUser(id)
        if (res.affectedRows == 1) {
            ctx.body = {
                code: 200,
                message: "删除用户成功！",
                data: res
            }
        }

    }
    async patchUser(ctx, next) {
        const patchId = ctx.params.id;
        const patchData = ctx.request.body;

        if (patchData.password) {
            const salt = generateSalt();
            patchData.salt = salt;
            patchData.password = md5password(patchData.password, salt);
        }
        const res = await userService.patchUser(patchId, patchData)
        if (res.affectedRows == 1) {
            ctx.body = {
                code: 200,
                message: "更新用户成功！",
                data: res
            }
        }
    }
}



module.exports = new UserController();