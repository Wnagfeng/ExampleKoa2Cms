const UserService = require('../service/user.service');
class UserController {
    constructor() { }
    getUserList(ctx, next) {
        // 解析完参数后传递给serveice层
        const res = UserService.getUserList()
        ctx.body = {
            message: "success",
            data: res
        }
    }
    async register(ctx, next) {
        const userdata = ctx.request.body;
        const res = await UserService.createUser(userdata)
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
    async login(ctx, next) {
        console.log("login")
    }
}
module.exports = new UserController();