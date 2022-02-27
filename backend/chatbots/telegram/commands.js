require('dotenv').config();

const { patients, doctors } = require('../../firestore');
const jwt = require('jsonwebtoken');

let CommandHandler = async (ctx) => {
	query = ctx.message.text;
	command = query.split(' ')[0];
	if (command === '/link') {
		token = query.split(' ')[1];
		if (!token) {
			return `Missing Token! Please key in your token with the command, with /link myTokenHere`;
		}
		jwt.verify(token, process.env.SECRET_TOKEN, (err, payload) => {
			if (err) {
				return 'Your token is invalid.';
			} else {
				if (payload.userType === 'Patient') {
					patients.doc(payload.documentId).set(
						{
							telegram: {
								id: ctx.message.from.id,
								chat_id: ctx.message.chat.id,
								username: ctx.message.from.username,
							},
						},
						{ merge: true }
					);
				} else {
					doctors.doc(payload.documentId).set(
						{
							telegram: {
								id: ctx.message.from.id,
								chat_id: ctx.message.chat.id,
								username: ctx.message.from.username,
							},
						},
						{ merge: true }
					);
				}
			}
		});
		return `Successfully linked`;
	}
};

module.exports = CommandHandler;
