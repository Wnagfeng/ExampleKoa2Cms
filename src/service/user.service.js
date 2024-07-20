
const conn = require('../app/database');

class UserService {
    constructor() {
    }

    async getUserByName(name) {
        const statement = 'SELECT * FROM `users` WHERE UserName = ?;';
        const [result] = await conn.execute(statement, [name]);
        return result;
    }

    async createUser(user) {
        const { username, password, salt } = user;
        const statement = 'INSERT INTO `users` (UserName, Password,salt) VALUES (?, ?,?);';
        const [result] = await conn.execute(statement, [username, password, salt]);
        return result;
    }

    async getUserSaltByName(name) {
        const statement = 'SELECT salt FROM `users` WHERE UserName = ?;';
        const [result] = await conn.execute(statement, [name]);
        return result[0].salt;
    }
}

module.exports = new UserService();
