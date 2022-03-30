import 'package:flutter_blue_example/home_page.dart';
import 'package:flutter_blue_example/profile_page.dart';
import 'package:flutter_blue_example/utils/colors.dart' as colors;
import 'package:flutter_blue_example/utils/constants.dart';
import 'package:flutter_blue_example/widgets/custom_sliver_widget.dart';
import 'package:flutter_blue_example/widgets/gender_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({Key? key}) : super(key: key);

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: colors.scaffoldColor,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomSliverView(
            columnList: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(
                  flex: 7,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(bottom: 30, left: 30, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 30.0),
                                      child: Text(
                                        'Create Profile',
                                        style: GoogleFonts.nunito(
                                            color: colors.primaryTextColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: TextFormField(
                                        //controller: _nameController,
                                          style: GoogleFonts.montserrat(
                                              color: colors.primaryTextColor),
                                          validator: (value) {
                                            if (value == "" || value == null) {
                                              return "Please enter a valid first name";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            label: Text('First name',
                                                style: GoogleFonts.nunito(
                                                    color: colors.textBoxTextColor,
                                                    fontSize: 17)),
                                            filled: true,
                                            hintText: 'Enter your first name',
                                            hintStyle: GoogleFonts.poppins(
                                                color: colors.textBoxTextColor),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            fillColor: colors.textBoxColor,
                                            focusColor: colors.textBoxColor,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: TextFormField(
                                        //controller: _nameController,
                                          style: GoogleFonts.montserrat(
                                              color: colors.primaryTextColor),
                                          validator: (value) {
                                            if (value == "" || value == null) {
                                              return "Please enter a valid last name";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            label: Text('Last name',
                                                style: GoogleFonts.nunito(
                                                    color: colors.textBoxTextColor,
                                                    fontSize: 17)),
                                            filled: true,
                                            hintText: 'Enter your last name',
                                            hintStyle: GoogleFonts.poppins(
                                                color: colors.textBoxTextColor),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            fillColor: colors.textBoxColor,
                                            focusColor: colors.textBoxColor,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: TextFormField(
                                        //controller: _nameController,
                                          style: GoogleFonts.montserrat(
                                              color: colors.primaryTextColor),
                                          validator: (value) {
                                            if (value == "" || value == null) {
                                              return "Please enter a valid first name";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            label: Text('Username',
                                                style: GoogleFonts.nunito(
                                                    color: colors.textBoxTextColor,
                                                    fontSize: 17)),
                                            filled: true,
                                            hintText: 'Enter your username',
                                            hintStyle: GoogleFonts.poppins(
                                                color: colors.textBoxTextColor),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            fillColor: colors.textBoxColor,
                                            focusColor: colors.textBoxColor,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: TextFormField(
                                        //controller: _nameController,
                                          style: GoogleFonts.montserrat(
                                              color: colors.primaryTextColor),
                                          validator: (value) {
                                            if (value == "" || value == null) {
                                              return "Please enter a valid phone number";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            label: Text('Phone number',
                                                style: GoogleFonts.nunito(
                                                    color: colors.textBoxTextColor,
                                                    fontSize: 17)),
                                            filled: true,
                                            hintText: 'Enter your phone number',
                                            hintStyle: GoogleFonts.poppins(
                                                color: colors.textBoxTextColor),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            fillColor: colors.textBoxColor,
                                            focusColor: colors.textBoxColor,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: TextFormField(
                                        //controller: _nameController,
                                          style: GoogleFonts.montserrat(
                                              color: colors.primaryTextColor),
                                          validator: (value) {
                                            if (value == "" || value == null) {
                                              return "Please enter a valid age";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            label: Text('Age',
                                                style: GoogleFonts.nunito(
                                                    color: colors.textBoxTextColor,
                                                    fontSize: 17)),
                                            filled: true,
                                            hintText: 'Enter your age',
                                            hintStyle: GoogleFonts.poppins(
                                                color: colors.textBoxTextColor),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            fillColor: colors.textBoxColor,
                                            focusColor: colors.textBoxColor,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: TextFormField(
                                        //controller: _nameController,
                                          style: GoogleFonts.montserrat(
                                              color: colors.primaryTextColor),
                                          validator: (value) {
                                            if (value == "" || value == null) {
                                              return "Please enter a valid emergency contact";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            label: Text('Emergency contact',
                                                style: GoogleFonts.nunito(
                                                    color: colors.textBoxTextColor,
                                                    fontSize: 17)),
                                            filled: true,
                                            hintText:
                                            'Enter your emergency contact',
                                            hintStyle: GoogleFonts.poppins(
                                                color: colors.textBoxTextColor),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            fillColor: colors.textBoxColor,
                                            focusColor: colors.textBoxColor,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, bottom: 15.0),
                                      child: Center(
                                          child: GenderPickerWidget(
                                            initialGender: FEMALE,
                                            title: 'Pick your gender',
                                            onChanged: (val) {},
                                            selectedColor: colors.accentColor,
                                          )),
                                    ),
                                  ],
                                ))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: colors.accentColor),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const HomePage()));
                                  },
                                  child: Text(
                                    'CONTINUE',
                                    style: GoogleFonts.nunito(
                                        color: colors.accentTextColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: colors.accentColor),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const ProfilePage()));
                                  },
                                  child: Text(
                                    'PROFILE',
                                    style: GoogleFonts.nunito(
                                        color: colors.accentTextColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(flex: 1, child: Container())
            ],
          ))
    ]);
  }
}
