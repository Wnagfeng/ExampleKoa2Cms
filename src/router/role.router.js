const Router = require('koa-router');
const Role = new Router();
const { verifyAuth } = require('../middleware/user.middleware')
const { createRole, deleteRole, getRoleList, getRole, getRoleAndMenu } = require("../controller/role.controller")
const { VerftRoleName } = require("../middleware/role.middleware.js")
Role.post('/role', verifyAuth, createRole)
Role.delete('/role/:id', verifyAuth, deleteRole)
Role.post("/role/list", verifyAuth, getRoleList)
Role.get("/role/:id", verifyAuth, getRole)
Role.get("/role/:id/menu", verifyAuth, getRoleAndMenu)

module.exports = Role;