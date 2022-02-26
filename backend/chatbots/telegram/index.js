const express = require('express');
const axios = require('axios').default;
const bodyParser = require('body-parser');

class TelegramServer {
	constructor(port, api, webhook, uri) {
		this.app = express();

		this.app.use(bodyParser.json());

		this.app.post(uri, async (req, res) => {
			console.log(req.body);

			const chatId = req.body.message.chat.id;
			const text = req.body.message.text;

			await axios.post(`${api}/sendMessage`, {
				chat_id: chatId,
				text: text,
			});

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
