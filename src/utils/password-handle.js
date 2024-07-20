const crypto = require('crypto');

// const md5password = (password) => {
//   const md5 = crypto.createHash('md5');
//   const result = md5.update(password).digest('hex');
//   return result;
// }
// 生成一个随机的盐
const generateSalt = () => {
  return crypto.randomBytes(16).toString('hex');
}

// 使用盐对密码进行哈希
const md5password = (password, salt) => {
  const md5 = crypto.createHash('md5');
  const saltedPassword = password + salt; // 将盐添加到密码中
  const result = md5.update(saltedPassword).digest('hex');
  return result;
}

// 验证用户输入的密码
const verifyPassword = (inputPassword, salt, storedHashedPassword) => {
  const inputHashedPassword = md5password(inputPassword, salt);
  return inputHashedPassword === storedHashedPassword;
}

module.exports = { md5password, generateSalt, verifyPassword };


