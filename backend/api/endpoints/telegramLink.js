require('dotenv').config();

const { patients, doctors } = require('../../firestore');
const jwt = require('jsonwebtoken');

const telegramLink = async (id, token) => {
	const patient = (await patients.doc(id).get()).data();
	const doctor = (await doctors.doc(id).get()).data();
	let userType;
	if (!doctor) {
		userType = 'Patient';
	} else {
		userType = 'Doctor';
	}
	const payload = {
		documentId: id,
		userType: userType,
	};

	const linkingToken = jwt.sign(payload, token);

	if (userType === 'Patient') {
		patients.doc(id).set(
			{
				telegram: {
					linkingToken: linkingToken,
				},
			},
			{ merge: true }
		);
	} else {
		doctors.doc(id).set(
			{
				telegram: {
					linkingToken: linkingToken,
				},
			},
			{ merge: true }
		);
	}

	return linkingToken;
};

module.exports = telegramLink;
