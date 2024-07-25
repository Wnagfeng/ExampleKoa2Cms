const CategorieService = require('../service/categorie.service');

class Categoriecontroller {
    constructor() { }
    async createCategorie(ctx, next) {
        const { name } = ctx.request.body;
        const res = await CategorieService.createcategoie(name)

        if (res) {
            ctx.body = {
                code: 200,
                message: '创建成功',
                data: res
            }
        }

    }
    async deleteCategorie(ctx, next) {
        const { id } = ctx.params;
        let res

        try {
            res = await CategorieService.deleteCategorie(id)
        } catch (err) {
            if (err.code == 'ER_ROW_IS_REFERENCED_2') {
                ctx.body = {
                    code: 500,
                    message: '删除失败,该分类下有商品',
                    data: err
                }
            }

        }
        if (res) {
            ctx.body = {
                code: 200,
                message: '删除成功',
                data: res
            }
        }
    }
    async patchCategrie(ctx, next) {
        const { id } = ctx.params;
        const { name } = ctx.request.body;
        console.log(name, id)
        const res = await CategorieService.patchCategrie(id, name)
        if (res) {
            ctx.body = {
                code: 200,
                message: '修改成功',
                data: res
            }
        }
    }
    async getCategories(ctx, next) {
        const id = ctx.params.id
        const res = await CategorieService.getCategories(id)
        if (res) {
            ctx.body = {
                code: 200,
                message: '获取成功',
                data: res
            }
        }
    }
    async getCategoriesList(ctx, next) {
        console.log("111")
        const res = await CategorieService.getCategoriesList()
        console.log(ctx.request.body)
        if (res) {
            ctx.body = {
                code: 200,
                message: '获取成功',
                data: res
            }
        }
    }
}

module.exports = new Categoriecontroller();