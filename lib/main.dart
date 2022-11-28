import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practical_ahmd/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
/*
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  Stream<QuerySnapshot<Map<String, dynamic>>> getDocument({
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

  Stream<QuerySnapshot<Map<String, dynamic>>> getStudent({
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

  Future<void> uploadStudent({
    required Map<String, dynamic> data,
    required String collection,
    required String uniqueKey,
  }) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(uniqueKey)
        .collection('subcollection')
        .add(data)
        .catchError((e) {
      log(e.toString());
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCollection(
      {required String collection, required String userid}) {
    return FirebaseFirestore.instance
        .collection(collection)
        .where(userid, isNull: false)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getFields({
    required String collection,
    required String uniqueKey,
  }) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(uniqueKey)
        .snapshots();
  }

  Future<void> uploadDocument({
    required Map<String, dynamic> data,
    required String collection,
    required String uniqueKey,
  }) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(uniqueKey)
        .collection('subcollection')
        .add(data)
        .catchError((e) {
      log(e.toString());
    });
  }

  Future<void> updateDocument({
    required Map<String, dynamic> data,
    required String collection,
    required String uniqueKey,
    required String subdocId,
  }) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(uniqueKey)
        .collection('subcollection')
        .doc(subdocId)
        .update(data)
        .catchError((e) {
      log(e.toString());
    });
  }

  Future<void> uploadFields(
      {required Map<String, int> data,
      required String collection,
      required String uniqueKey,
      bool? reset}) async {
    DocumentSnapshot<Map<String, dynamic>>? document;
    try {
      document = await FirebaseFirestore.instance
          .collection(collection)
          .doc(uniqueKey)
          .get()
          .catchError((e) {
        log(e.toString());
      });
    } catch (e) {}
    if ((document?.exists ?? false) &&
        (document!.data()?.isNotEmpty ?? false)) {
      Map<String, int> sortedData = {...document.data()!};
      data.forEach((key, value) {
        if (document!.data()!.containsKey(key)) {
          sortedData.addAll(
            {
              key: (reset ?? false) ? 0 : ((document.data()![key] ?? 0) + value)
            },
          );
        } else {
          sortedData.addAll({key: value});
        }
        log(sortedData.toString());
      });
      await FirebaseFirestore.instance
          .collection(collection)
          .doc(uniqueKey)
          .update({
        ...sortedData,
      }).catchError(
        (e) {
          log(
            e.toString(),
          );
        },
      );
    } else {
      await FirebaseFirestore.instance
          .collection(collection)
          .doc(uniqueKey)
          .set(data)
          .catchError(
            (e) {},
          );
    }
    ;
  }

  Future<String?> uploadFile({File? file, required String filepath}) async {
    if (file == null) {
      return null;
    }
    Reference ref =
        await FirebaseStorage.instance.ref("images").child("$filepath");
    final uploadTask = await ref.putFile(File(file.path));
    if (uploadTask.state == TaskState.success) {
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } else {
      await uploadTask.state;
    }
    return null;
  }

  generateUniqueKey({required int userId1, required int userId2}) {
    List<int> list = [userId1, userId2];
    list.sort();
    return '${list[0]}-${list[1]}';
  }
}
 */
