const chatbots = require('./chatbots/index');
const api = require('./api/index');

chatbots.telegram();
api.apiServer();
