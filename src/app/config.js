const dotenv = require('dotenv');
const fs = require('fs');
const path = require('path');

dotenv.config();

const PRIVATE_KEY = fs.readFileSync(path.resolve(__dirname, './keys/private.key'));
const PUBLIC_KEY = fs.readFileSync(path.resolve(__dirname, './keys/public.key'));

const WEB_PRIVATE_KEY = fs.readFileSync(path.resolve(__dirname, './keys/WEB_PRIVATE_KEY.key'));
const WEB_PUBLIC_KEY = fs.readFileSync(path.resolve(__dirname, './keys/WEB_PUBLIC_KEY.key'));

module.exports = {
  APP_HOST,
  APP_PORT,
  MYSQL_HOST,
  MYSQL_PORT,
  MYSQL_DATABASE,
  MYSQL_USER,
  MYSQL_PASSWORD,
  PASSWORD_KEY
} = process.env;

module.exports.PRIVATE_KEY = PRIVATE_KEY;
module.exports.PUBLIC_KEY = PUBLIC_KEY;
module.exports.WEB_PRIVATE_KEY=WEB_PRIVATE_KEY;
module.exports.WEB_PUBLIC_KEY=WEB_PUBLIC_KEY;