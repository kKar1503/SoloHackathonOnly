require('dotenv').config();

const PORT = process.env.API_PORT || 4000;
const { API_URL, SECRET_TOKEN } = process.env;

const APIServer = require('./endpoints/apiServer');

const InitializeAPIServer = () => {
	return new APIServer(PORT, API_URL, SECRET_TOKEN);
};

module.exports = { apiServer: InitializeAPIServer };
