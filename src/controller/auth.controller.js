const jwt = require('jsonwebtoken');
const { PRIVATE_KEY } = require('../app/config');

class AuthController {
  async login(ctx, next) {
    const { UserID, UserName } = ctx.user;
    const token = jwt.sign({ UserID, UserName }, PRIVATE_KEY, {
      expiresIn: 60 * 60 * 24,
      algorithm: 'RS256'
    });
    ctx.body = {
      code: 200,
      message: "登录成功",
      data: {
        UserID, UserName, token
      }
    }

  }

  async success(ctx, next) {

    ctx.body = {
      code: 200,
      message: "授权成功",
      data: {
        UserID: ctx.user.UserID,
        UserName: ctx.user.UserName
      }
    };
  }
}

module.exports = new AuthController();
