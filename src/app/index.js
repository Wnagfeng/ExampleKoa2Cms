const Koa = require('koa');
const bodyParser = require('koa-bodyparser');
const errorHandler = require('./error-handle');
const useRoutes = require('../router');
const cors = require('koa2-cors');

const app = new Koa();

app.useRoutes = useRoutes;

// 使用 cors 中间件
app.use(cors({
    origin: '*', // 允许所有来源，可以根据需要进行配置
    allowMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS', "PATCH"], // 允许的 HTTP 方法
    allowHeaders: ['Content-Type', 'Authorization', 'Accept'], // 允许的 HTTP 头
    exposeHeaders: ['WWW-Authenticate', 'Server-Authorization'] // 暴露的 HTTP 头
}));

app.use(bodyParser());
app.useRoutes();
app.on('error', errorHandler);

module.exports = app;
