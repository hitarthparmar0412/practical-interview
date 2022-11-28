import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
    required Map<String, dynamic> data,
    required String collection,
  }) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc()
        .collection('subcollection')
        .add(data)
        .catchError((e) {
      log(e.toString());
    });
  }
}
