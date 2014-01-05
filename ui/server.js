var express = require('express');
var https = require('https');
var fs = require('fs');

var options = {
  key: fs.readFileSync('privatekey.pem'),
  cert: fs.readFileSync('certificate.pem')
};

var app = express();

https.createServer(options, app).listen(3000);

app.use("/", express.static(__dirname + "/public"));