const { async } = require('@firebase/util');
const { patients, doctors } = require('./firestore');

let validation = {
	validate: async (ctx) => {
		const patient = await patients.where('telegram.id', '==', ctx.message.from.id).get();

		return patient.docs.length != 0;
	},
	userType: async (ctx) => {
		const patient = await patients.where('telegram.id', '==', ctx.message.from.id).get();
		const doctor = await doctors.where('telegram.id', '==', ctx.message.from.id).get();
		if (patient.docs.length != 0) {
			return 'Patient';
		}
		if (doctor.docs.length != 0) {
			return 'Doctor';
		}
	},
};

module.exports = { validation };
