function buildMenuTree(menuItems) {
    const menuMap = {};
    const menuTree = [];

    // Create a map of id to menu item
    menuItems.forEach(item => {
        item.children = [];
        menuMap[item.id] = item;
    });

    // Build the tree structure
    menuItems.forEach(item => {
        if (item.parentId === null) {
            menuTree.push(item);
        } else {
            const parent = menuMap[item.parentId];
            if (parent) {
                parent.children.push(item);
            }
        }
    });

    return menuTree;
}
module.exports = {
    buildMenuTree
};