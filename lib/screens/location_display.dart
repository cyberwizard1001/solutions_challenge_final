import 'package:flutter_blue_example/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_example/utils/colors.dart' as colors;


class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LocationWidgetField(context: context, title: 'Share location')
          ],
        ),
      ),
    );
  }
}
