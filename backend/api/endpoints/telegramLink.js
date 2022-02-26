const { patients, doctors } = require('../../firestore');

const telegramLink = async (id) => {
	const patient = await patients.doc(id).get();
	const doctor = await doctors.doc(id).get();
	const user = patient || doctor;
	console.log(user);
};

module.exports = telegramLink;
