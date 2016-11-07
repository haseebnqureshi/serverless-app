'use strict';

const fs = require('fs');

module.exports.viewIndex = (event, context, callback) => {
  const response = {
    statusCode: 200,
    headers: {
      'Content-Type': 'text/html'
    },
    body: fs.createReadStream(__dirname + '/index.html')
  };
  context.succeed(response);
};
