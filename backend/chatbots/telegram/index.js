const express = require('express');
const axios = require('axios');
const bodyParser = require('body-parser');

class TelegramServer {
	constructor(port, api, webhook) {
		this.app = express();

		this.app.use(bodyParser.json());

		listen(port, async () => {
			console.log(`App running on port ${port}`);
			await this.init(api, webhook);
		});
	}

	init = async (api, webhook) => {
		const res = await axios.get(`${api}/setWebhook?url=${webhook}`);
		console.log(res.data);
	};
}

module.exports = TelegramServer;
