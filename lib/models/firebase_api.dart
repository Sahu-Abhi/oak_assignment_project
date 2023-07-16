import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> userSetup(
    {required String id,
    required String fullName,
    required String email,
    required String phoneNo}) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  users.doc(id).set({
    "FullName": fullName,
    "Email": email,
    "Phone": phoneNo,
  });
  return;
}
