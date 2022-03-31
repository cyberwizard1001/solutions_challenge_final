import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_example/widgets/custom_sliver_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_blue_example/utils/colors.dart' as colors;
import 'package:flutter_blue_example/utils/constants.dart' as constants;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String oxygenData = "", heartRateData = "";


  @override
  void initState() {
    super.initState();
    var heartRate = FirebaseDatabase.instance.ref("heartrate");
    var oxygen = FirebaseDatabase.instance.ref("oxygen");

    //To change trigger value
    // var trigger = FirebaseDatabase.instance.ref("trigger-sentry");
    // trigger.set(true);

    heartRate.onValue.listen((DatabaseEvent event) {
      setState(() {
        heartRateData = event.snapshot.value.toString();
      });
    });

    oxygen.onValue.listen((DatabaseEvent event) {
      setState(() {
        oxygenData = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: CustomSliverView(
        columnList: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 60, left: 20.0, right: 20.0),
              child: Text(
                'Welcome',
                style: GoogleFonts.montserrat(
                    color: colors.primaryTextColor, fontSize: 40),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Adheena B',
                style: GoogleFonts.montserrat(
                    color: colors.primaryTextColor, fontSize: 20),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    color: colors.accentColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0, bottom: 50.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.monitor_heart, color: colors.errorColor,),
                                  Text('HEART RATE', style: GoogleFonts.montserrat(color: colors.scaffoldColor, fontSize: 15),)
                                ],),
                                Row(
                                  children: [
                                    Icon(Icons.healing, color: colors.errorColor,),
                                    Text('BLOOD OXYGEN', style: GoogleFonts.montserrat(color: colors.scaffoldColor, fontSize: 15),)
                                  ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(heartRateData, style: GoogleFonts.montserrat(fontSize: 80, color: colors.scaffoldColor),),
                                  Align(alignment: Alignment.bottomRight,child: Text('BPM', style: GoogleFonts.montserrat(fontSize: 20, color: colors.scaffoldColor),))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(oxygenData, style: GoogleFonts.montserrat(fontSize: 80, color: colors.scaffoldColor),),
                                  Text('%', style: GoogleFonts.montserrat(fontSize: 20, color: colors.scaffoldColor),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          color: colors.cardColor,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Row(
                                children: [
                                  Text(heartRateData,style: GoogleFonts.montserrat(fontSize: 60, color: colors.primaryTextColor),),
                                  Align(alignment: Alignment.bottomRight,child: Text('BPM', style: GoogleFonts.montserrat(fontSize: 20, color: colors.primaryTextColor),))
                                ],
                              )]
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          color: colors.cardColor,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(oxygenData,style: GoogleFonts.montserrat(fontSize: 60, color: colors.primaryTextColor),),
                                      Align(alignment: Alignment.bottomRight,child: Text('%', style: GoogleFonts.montserrat(fontSize: 20, color: colors.primaryTextColor),))
                                    ],
                                  ),
                                ]
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          //Add a button to turn off monitoring and a correspondong value on realtime database
        ],
      ),
    );
  }
}
