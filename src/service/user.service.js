
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
        const { username, password } = user;
        const statement = 'INSERT INTO `users` (UserName, Password) VALUES (?, ?);';
        const [result] = await conn.execute(statement, [username, password]);
        return result;
    }

    getUserList() {
        return [
            {
                id: 1,
                name: 'John',
                age: 25
            },
            {
                id: 2,
                name: 'Mary',
                age: 30
            },
            {
                id: 3,
                name: 'Tom',
                age: 28
            }
        ];
    }
}

module.exports = new UserService();
