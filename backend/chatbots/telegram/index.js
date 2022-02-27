const express = require('express');
const axios = require('axios').default;
const bodyParser = require('body-parser');
const validation = require('./validation');
const CommandsHandler = require('./commands');

class TelegramServer {
	constructor(port, api, webhook, uri) {
		this.app = express();

		this.app.use(bodyParser.json());

		this.app.post(uri, async (req, res) => {
			const ctx = req.body;
			console.log(ctx.message);
			const chat_id = ctx.message.chat.id;
			const message = ctx.message.text;

			if (!(await validation.validate(ctx))) {
				await this.sendMessage(
					`You do not have any account linked with Doctor.io, please register a Doctor.io account and link your Telegram account with /link.`,
					api,
					chat_id
				);
				return res.send();
			}

			if (!ctx.message.entities) {
				await this.sendMessage('Please use one of the commands to start, type / to see the list of commands.', api, chat_id);
				return res.send();
			}

			if (ctx.message.entities.some((e) => e.type === 'bot_command')) {
				CommandsHandler(ctx)
					.then(async (message) => {
						await this.sendMessage(message, api, chat_id);
					})
					.catch((err) => console.log(err));
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

	sendMessage = async (message, api, chat_id) => {
		await axios.post(`${api}/sendMessage`, {
			chat_id: chat_id,
			text: message,
		});
	};
}

module.exports = TelegramServer;
