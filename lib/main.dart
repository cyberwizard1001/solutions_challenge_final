import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_example/screens/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_blue_example/screens/video_player.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var heartRate = FirebaseDatabase.instance.ref("heartrate");

  //To change trigger value
  var trigger = FirebaseDatabase.instance.ref("trigger-sentry");
  trigger.set(true);

  heartRate.onValue.listen((DatabaseEvent event) {
    print(event.snapshot.value);
  });

  var oxygen = FirebaseDatabase.instance.ref("oxygen");

  oxygen.onValue.listen((DatabaseEvent event) {
    print(event.snapshot.value);
  });

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

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VideoApp(),
    //theme: darkTheme.,
  ));
}
