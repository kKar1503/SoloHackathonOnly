import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
// import 'package:jamal_v1/model/user_particulars.dart';

class DataService {
  final String uid;

  DataService({required this.uid});

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future updateUserData({
    required String email,
    required String password,
    required String last,
    required String first,
    required String nric,
    required String type,
    required String dob,
  }) async {
    Map data = {
      'email': email,
      'password': password,
      'last': last,
      'first': first,
      'nric': nric,
      'type': type,
      'dob': dob,
    };

    CollectionReference collection = type == "doctor"
        ? firestore.collection("doctors")
        : firestore.collection("patients");
    return await collection.doc(uid).set({"data": data});
  }
}



//   // get a particulars list from snapshot so we dont have to keep retrieving
//   List<UserParticulars> _particularsListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.docs.map((document) {
//       return UserParticulars(
//         name: document.data()['name'] ?? "no name",
//         age: document.data()['age'] ?? "no age",
//         height: document.data()['height'] ?? "no height",
//         weight: document.data()['weight'] ?? "no weight",
//         fitnessLevel: document.data()['fitnessLevel'] ?? "no fitnessLevel",
//       );
//     }).toList();
//   }

//   // get particulars stream
//   Stream<List<UserParticulars>> get particularsStream {
//     return particularsCollection.snapshots().map(_particularsListFromSnapshot);
//   }
// }