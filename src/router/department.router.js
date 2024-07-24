const Router = require('koa-router');
const Department = new Router();
const { getDepartmentsList, createDepartment, deleteDepartment, patchDepartment, getDepartment } = require('../controller/departments.controller')
const { verifyAuth } = require('../middleware/user.middleware')
const { verifyDepartmentName } = require("../middleware/department.middleware")
Department.post('/department/list', verifyAuth, getDepartmentsList);
Department.post("/department", verifyAuth, verifyDepartmentName, createDepartment);
Department.delete("/department/:id", verifyAuth, deleteDepartment)
Department.patch("/department/:id", verifyAuth, patchDepartment)
Department.get("/department/:id", verifyAuth, getDepartment)
module.exports = Department;