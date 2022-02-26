const admin = require('firebase-admin');
const path = require('path');
const serviceAccount = require(path.join(__dirname, '..', '..', 'ServiceAccountKey.json'));

admin.initializeApp({
	credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

const patientsRef = db.collection('patients');
const doctorsRef = db.collection('doctors');

module.exports = {
	patients: patientsRef,
	doctors: doctorsRef,
};
