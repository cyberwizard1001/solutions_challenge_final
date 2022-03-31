import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_example/screens/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oktoast/oktoast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// Firebase FireStore
  // CollectionReference _collectionRef =
  // FirebaseFirestore.instance.collection('heartrate');
  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await _collectionRef.get();
  //
  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //
  //   print(allData);
  // }
  // getData();

  runApp(OKToast(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      //theme: darkTheme.,
    ),
  ));
}
