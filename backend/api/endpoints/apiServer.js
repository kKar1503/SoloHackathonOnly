require('dotenv').config();
const express = require('express');
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');

const TelegramLink = require('./telegramLink');
const TelegramVerify = require('./telegramVerify');

class APIServer {
	constructor(port, url, token) {
		this.app = express();

		this.app.use(bodyParser.json());

		this.app.post('/telegram/link', async (req, res) => {
			console.log(req.body);
			const documentId = req.body.documentId;
			TelegramLink(documentId);

			console.log('success');

			return res.send({ token: 'dummyToken' });
		});

		this.app.listen(port, async () => {
			console.log(`App running on port ${port}`);
		});
	}
}

module.exports = APIServer;
