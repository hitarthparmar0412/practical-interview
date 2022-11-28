import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practical_ahmd/widgets/student_list_item_view.dart';

import '../model/student_model.dart';

class DatabaseMethods {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getStudent({
    required String collection,
    required String uniqueKey,
  }) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(uniqueKey)
        .collection('subcollection')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  static Future<void> uploadStudent({
    required Student data,
    required String collection,
  }) async {
    await FirebaseFirestore.instance.collection(collection).add({
      "name": data.name,
      "maths": data.maths,
      "image": data.image,
      "science": data.science,
      "history": data.history,
    }).catchError((e) {
      log(e.toString());
    });
  }

  static Future<void> updateStudent({
    required Student data,
    required String collection,
    required String username,
  }) async {
    await FirebaseFirestore.instance.collection(collection).doc().update({
      "name": data.name,
      "maths": data.maths,
      "image": data.image,
      "science": data.science,
      "history": data.history,
    }).catchError((e) {
      log(e.toString());
    });
  }
}
