import 'package:flutter_blue_example/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

/**
 * Form Widget to get current location with validation
 */

class LocationWidgetField extends FormField<Position> {
  LocationWidgetField(
      {Key? key,
        FormFieldSetter<Position>? onSaved,
        FormFieldValidator<Position>? validator,
        Position? defaultValue,
        required BuildContext context,
        required String title,
        AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction})
      : super(
      key: key,
      onSaved: onSaved,
      validator: validator ??
              (data) {
            if (data == null) return "Location field empty";
            return null;
          },
      initialValue: defaultValue,
      autovalidateMode: autoValidateMode,
      builder: (FormFieldState<Position> state) {
        return Container(
          decoration: BoxDecoration(color: colors.scaffoldColor),
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/location.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 30),
                    child: Center(
                      child: Text(title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              color: colors.primaryTextColor)),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    color: colors.scaffoldColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0,
                          color: state.hasError
                              ? colors.errorColor
                              : colors.scaffoldColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: state.hasError
                            ? Text(
                          state.errorText ?? "error",
                          style: GoogleFonts.poppins(
                              color: colors.errorColor,
                              fontSize: 10),
                        )
                            : Text(
                            state.value != null
                                ? state.value.toString()
                                : "Please fetch your location",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: colors.primaryTextColor)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: ElevatedButton(
                      onPressed: () async {
                        _determinePosition(context).then((value) {
                          state.didChange(value);
                        }).catchError((onError, stackTrace) {
                          state.didChange(null);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            content: Text(onError),
                          ));
                        });
                      },
                      child: Text(
                        'GET LOCATION',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: colors.accentTextColor),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: colors.accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Share.share("Traveler's current location is: " +
                            _determinePosition(context).toString());
                      },
                      style: ElevatedButton.styleFrom(primary: colors.accentColor),
                      child: Text(
                        'SHARE LOCATION',
                        style: GoogleFonts.poppins(
                            color: colors.accentTextColor,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )),
        );
      });
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

  Share.share("Traveler's current location is: " + location.toString());
  Navigator.of(progressContext!, rootNavigator: true).pop();
  return location;
}
