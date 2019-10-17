const {createServer} = require('http');
const bodyParser = require('body-parser');
const express = require('express');
const logger = require('morgan');
const app = express();

app.use(logger('dev'));
app.use((req, res, next) => {
  if (req.method === 'OPTIONS') {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, DELETE, PUT, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Authorization, Content-Type');
    res.setHeader('Access-Control-Max-Age', '86400');
  }
  next();
});

app.use(bodyParser.json()); // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({extended: true})); // to support URL-encoded bodies
app.use('/v1/api/sample-api', require('./api/sample-api'));

module.exports = () => {
  console.log('Staring server at port: 5000');
  createServer(app).listen(5000);
};
