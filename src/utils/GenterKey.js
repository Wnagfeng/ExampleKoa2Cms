var  NodeRSA  = require('node-rsa')
 //1.创建RSA对象，并指定 秘钥长度
var key = new NodeRSA({ b: 512 });
key.setOptions({ encryptionScheme: 'pkcs1' });//指定加密格式

 //2.生成 公钥私钥，使用 pkcs8标准，pem格式
var publicPem = key.exportKey('pkcs8-public-pem');//制定输出格式
var privatePem = key.exportKey('pkcs8-private-pem');

console.log('公钥:\n',publicPem);
console.log('私钥:\n', privatePem);