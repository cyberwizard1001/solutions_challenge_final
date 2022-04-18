import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_example/utils/notification_service.dart';
import 'package:flutter_blue_example/widgets/custom_sliver_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_blue_example/utils/colors.dart' as colors;

class SentryPage extends StatefulWidget {
  const SentryPage({Key? key}) : super(key: key);

  @override
  State<SentryPage> createState() => _SentryPageState();

}

class _SentryPageState extends State<SentryPage> {
  @override
  Widget build(BuildContext context) {
    NotificationService.showNotification(id: 0, title: 'ALERT!',body: 'Sentry mode has been turned on, device is now recording video');
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
                      color: colors.primaryTextColor, fontSize: 35, fontWeight: FontWeight.w600),
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
}
