const express = require('express');
const axios = require('axios').default;
const bodyParser = require('body-parser');
const validation = require('./validation');

class TelegramServer {
	constructor(port, api, webhook, uri) {
		this.app = express();

		this.app.use(bodyParser.json());

		this.app.post(uri, async (req, res) => {
			console.log(req.body);

			if (!validation.validate(req.body)) {
			}

			return res.send();
		});

		this.app.listen(port, async () => {
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
