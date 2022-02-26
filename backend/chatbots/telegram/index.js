const express = require('express');
const axios = require('axios').default;
const bodyParser = require('body-parser');
const { validation } = require('./validation');
const jwt = require('jsonwebtoken');
const { async } = require('@firebase/util');

class TelegramServer {
	constructor(port, api, webhook, uri) {
		this.app = express();

		this.app.use(bodyParser.json());

		this.app.post(uri, async (req, res) => {
			const ctx = req.body;
			const chat_id = ctx.message.chat.id;
			const message = ctx.message.text;

			if (!(await validation.validate(ctx))) {
				await this.sendMessage(
					`You do not have any account linked with Doctor.io, please register a Doctor.io account and link your Telegram account.`,
					api,
					chat_id
				);
			}

			await this.sendMessage(`Your user type is: ${await validation.userType(ctx)}`, api, chat_id);

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

	sendMessage = async (message, api, chat_id) => {
		await axios.post(`${api}/sendMessage`, {
			chat_id: chat_id,
			text: message,
		});
	};
}

module.exports = TelegramServer;
