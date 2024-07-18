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
}
module.exports = new UserController();