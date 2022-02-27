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
			const documentId = req.body.documentId;
			const linkingToken = await TelegramLink(documentId, token);

			return res.send({ token: linkingToken });
		});
	}
}

module.exports = APIServer;
