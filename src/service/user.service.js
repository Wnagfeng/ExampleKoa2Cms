class UserService {
    constructor() {

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