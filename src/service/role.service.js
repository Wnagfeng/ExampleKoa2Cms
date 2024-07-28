const conn = require('../app/database');
const menuService = require('../service/menu.service');
class RoleService {
  constructor() { }

  async GetRoleForname(name) {
    const sql = 'SELECT * FROM role WHERE name = ?';
    const [result] = await conn.query(sql, [name]);
    return result;
  }

  async create(roledata) {
    const { name, intro, menuList } = roledata;
    let roleId = '';
    let isExistingRole = false;

    try {
      // 检查角色是否存在
      const existingRole = await this.GetRoleForname(name);
      if (existingRole.length > 0) {
        // 角色存在，更新角色信息
        isExistingRole = true;
        roleId = existingRole[0].id;
        const updateRoleQuery = 'UPDATE role SET intro = ? WHERE id = ?;';
        const [updateRoleResult] = await conn.execute(updateRoleQuery, [intro, roleId]);
        if (!updateRoleResult) throw new Error('更新角色信息失败');
      } else {
        // 角色不存在，插入新角色
        const insertRoleQuery = 'INSERT INTO `role` (name, intro) VALUES (?, ?);';
        const [insertRoleResult] = await conn.execute(insertRoleQuery, [name, intro]);
        if (!insertRoleResult) throw new Error('角色创建失败');

        // 获取新插入角色的ID
        const getRoleIdQuery = 'SELECT id FROM role WHERE role.`name` = ?;';
        const [roleIdResult] = await conn.execute(getRoleIdQuery, [name]);
        if (!roleIdResult || roleIdResult.length === 0) throw new Error('获取角色ID失败');
        roleId = roleIdResult[0].id;
        console.log(roleId);
      }

      // 删除当前角色的所有角色-菜单关系
      const deleteRoleMenuQuery = 'DELETE FROM role_menu WHERE roleId = ?;';
      const [deleteRoleMenuResult] = await conn.execute(deleteRoleMenuQuery, [roleId]);
      if (!deleteRoleMenuResult) throw new Error('删除角色-菜单关系失败');

      // 插入新的角色-菜单关系
      const insertRoleMenuQuery = 'INSERT INTO `role_menu` (roleId, menuId) VALUES (?, ?);';
      for (const menuId of menuList) {
        await conn.execute(insertRoleMenuQuery, [roleId, menuId]);
      }

      const message = isExistingRole ? '角色修改并设置权限成功' : '角色创建并设置权限成功';
      return { success: true, roleId: roleId, message: message };
    } catch (error) {
      console.error('操作失败:', error);
      return { success: false, error: error.message };
    }
  }
  async delete(roleId) {
    try {
      const deleteRoleQuery = 'DELETE FROM role WHERE id = ?;';
      const [deleteRoleResult] = await conn.execute(deleteRoleQuery, [roleId]);
      if (!deleteRoleResult) throw new Error('删除角色失败');

      const deleteRoleMenuQuery = 'DELETE FROM role_menu WHERE roleId = ?;';
      const [deleteRoleMenuResult] = await conn.execute(deleteRoleMenuQuery, [roleId]);
      if (!deleteRoleMenuResult) throw new Error('删除角色-菜单关系失败');

      return { success: true, message: '删除角色成功' };
    } catch (error) {
      console.error('操作失败:', error);
      return { success: false, error: error.message };
    }
  }
  async getRoleList(queryData = {}) {
    const { offset = 0, size = 10 } = queryData;
    console.log(queryData)
    const sql = `SELECT * FROM role LIMIT ?,?`;
    const [result] = await conn.query(sql, [offset, size]);
    return result;
  }
  async getRole(roleId) {
    // 查询角色信息
    const roleQuery = 'SELECT * FROM role WHERE id = ?';
    const [roleResult] = await conn.query(roleQuery, [roleId]);
    if (roleResult.length === 0) {
      throw new Error('角色不存在');
    }


    // 查询角色的权限列表
    const menuQuery = `
      SELECT menuId 
      FROM role_menu 
      WHERE roleId = ?
    `;
    const [menuResult] = await conn.query(menuQuery, [roleId]);

    // 返回角色信息及权限列表
    return {
      ...roleResult[0],
      menuList: menuResult.map(row => row.menuId)
    };
  }
  async getRoleAndMenu(roleId) {
    // 查询角色信息
    const roleQuery = 'SELECT * FROM role WHERE id = ?';
    const [roleResult] = await conn.query(roleQuery, [roleId]);
    if (roleResult.length === 0) {
      throw new Error('角色不存在');
    }
    // 查询角色的权限菜单ID列表
    const menuIdsQuery = `
      SELECT rm.roleId, JSON_ARRAYAGG(rm.menuId) AS menuIds
      FROM role_menu rm
      WHERE rm.roleId = ?
      GROUP BY rm.roleId;
    `;
    const [menuIdsResult] = await conn.query(menuIdsQuery, [roleId]);
    const menuIds = menuIdsResult[0]?.menuIds || [];
    // 获取所有的菜单树
    const allMenus = await menuService.getMenuList();
    // 根据menuIds过滤出需要的菜单树
    function filterMenu(menuList, menuIds) {
      return menuList.reduce((filteredMenu, menuItem) => {
        if (menuItem.children) {
          menuItem.children = filterMenu(menuItem.children, menuIds);
        }
        if (menuIds.includes(menuItem.id)) {
          filteredMenu.push(menuItem);
        }
        return filteredMenu;
      }, []);
    }

    const filteredMenu = filterMenu(allMenus, menuIds);

    // 返回角色信息及权限菜单树
    return {
      role: roleResult[0],
      menuList: filteredMenu
    };
  }
}

module.exports = new RoleService();
