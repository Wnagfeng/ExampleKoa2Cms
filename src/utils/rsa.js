const NodeRSA = require('node-rsa');

// 解密函数
function decrypt(encryptedText, privatePem) {
    try {
        // 创建 RSA 对象并加载私钥
        const key = new NodeRSA();
        key.importKey(privatePem, 'pkcs8-private-pem'); // 载入私钥

        // 设置填充模式，必须与加密时相同
        key.setOptions({ encryptionScheme: 'pkcs1' }); // 使用 PKCS#1 填充模式

        // 解密数据
        // 注意，encryptedText 需要是 Base64 编码的字符串
        const decrypted = key.decrypt(Buffer.from(encryptedText, 'base64'), 'utf8');

        return decrypted;
    } catch (error) {
        console.error("解密出错:", error.message);
        return null;
    }
}

// 示例生成的私钥（替换为实际私钥）
const privatePem = `
-----BEGIN PRIVATE KEY-----
MIIBVQIBADANBgkqhkiG9w0BAQEFAASCAT8wggE7AgEAAkEA1oFDY+T03QVp+jbH
hE+T389HfNFFKlWP5VrWDlqwzzFtswQN/4S2QuF41MERRAYCkgFHiVxFdII88U2J
NPm8AwIDAQABAkBNGlej35eYnqqSUwBycbxAlZwnpH1NE0ZO9dC9hiHJx10ItO2a
/3yPQv6bmsXHBNNFm2I6/WRPK1bCPKPxWoopAiEA8wGUYPlCrKSLWDDQKMrcs+qN
B6Fpa+4qdBZrS9UCxP0CIQDh+Yp4nMpLyr6xlNTYPWgYWIHYqbzY2Ev2ODUZw07U
/wIhAIB7tlMrl5gmi9J+RKE82UJ7YkPFkTLSwzmL3QFER+mVAiBC/8C9iAc2t5MY
hb8hqfs+FKfS/GiAhojnJL0huVWbMwIhANWUZkhJQl/NSfR7BayqVUt/0Oxam+JI
yFJPzSf6mbso
-----END PRIVATE KEY-----
`;

// 替换为实际的加密数据
const encryptedText = "KvuDObbaSkhZnifthZ+H8Nkgp4qUszkq6pxY8lBwl8fmgdtT8cyk2ZeRwpT1+V3hLA7rmQtpgTtqioVhM9XJew=="// 需要解密的密文

// const decryptedText = decrypt(encryptedText, privatePem);

// console.log("解密后：", decryptedText);
module.exports = {
    decrypt
}