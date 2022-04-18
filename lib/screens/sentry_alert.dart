import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_example/utils/notification_service.dart';
import 'package:flutter_blue_example/widgets/custom_sliver_widget.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_blue_example/utils/colors.dart' as colors;
import 'package:share_plus/share_plus.dart';

class SentryPage extends StatefulWidget {
  const SentryPage({Key? key}) : super(key: key);

  @override
  State<SentryPage> createState() => _SentryPageState();
}

class _SentryPageState extends State<SentryPage> {
  @override
  Widget build(BuildContext context) {
    NotificationService.showNotification(
        id: 0,
        title: 'ALERT!',
        body: 'Sentry mode has been turned on, device is now recording video');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: CustomSliverView(
          columnList: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 80, left: 20.0, right: 20.0),
                child: Text(
                  'Sentry Mode',
                  style: GoogleFonts.montserrat(
                      color: colors.primaryTextColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
                child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    primary: Colors.red,
                    padding: EdgeInsets.all(40),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  var trigger = FirebaseDatabase.instance.ref("trigger-sentry");
                  trigger.set(false);

                  Navigator.of(context).pop();
                },
                child: Text("Disable Sentry Mode"),
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _determinePosition(context);
  }
}

Future<Position> _determinePosition(context) async {
  bool serviceEnabled;
  LocationPermission permission;
  BuildContext? progressContext;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error(
        'Location services are disabled, try enabling location in your device');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, permission cannot be requested.');
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      progressContext = context;
      return WillPopScope(
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: CircularProgressIndicator(),
                  ),
                  Text(
                    "Fetching Location",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          onWillPop: () async => false);
    },
  );

  var location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);

  //Share.share("Traveler's current location is: " + location.toString());
  Navigator.of(progressContext!, rootNavigator: true).pop();
  String? userName = FirebaseAuth.instance.currentUser!.displayName;
  String message =
      "${userName} might need quick help right now, elevated heart rate and unusual activities located at https://www.google.com/maps?q=${location.latitude},${location.longitude}";
  List<String> recipients = ["9080336540"]; //TODO: Replace list

  _sendSMS(message, recipients);
  return location;
}

void _sendSMS(String message, List<String> rec) async {
  String _result =
      await sendSMS(message: message, recipients: rec).catchError((onError) {
    print(onError);
  });
  print(_result);
}
