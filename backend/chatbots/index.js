require('dotenv').config();

const PORT = process.env.TELEGRAM_PORT || 5000;
const { TELEGRAM_TOKEN, SERVER_URL } = process.env;
const TELEGRAM_API = `https://api.telegram.org/bot${TELEGRAM_TOKEN}`;
const URI = `/webhook/${TELEGRAM_TOKEN}`;
const WEBHOOK_URL = SERVER_URL + URI;

const TelegramServer = require('./telegram/index');

const InitializeTelegramBot = () => {
	if (!TELEGRAM_TOKEN) {
		return new Error('Missing Token: Please specify the Telegram bot token in the TOKEN Environmental Variable.');
	}

	return new TelegramServer(PORT, TELEGRAM_API, WEBHOOK_URL, URI);
};

module.exports = { telegram: InitializeTelegramBot };
