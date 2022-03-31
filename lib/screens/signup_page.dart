import 'package:flutter_blue_example/screens/dash_board.dart';
import 'package:flutter_blue_example/screens/sign_in_page.dart';
import 'package:flutter_blue_example/widgets/custom_sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_blue_example/utils/colors.dart' as colors;
import 'package:flutter_blue_example/utils/constants.dart' as constants;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  String error = "";

  bool showProgress = false;

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
                  flex: 4,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container())),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 80, bottom: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome',
                              style: GoogleFonts.nunito(
                                color: colors.primaryTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Padding(
                                padding:
                                const EdgeInsets.only(top: 1, bottom: 20),
                                child: Text(
                                  'Register with Cabriolet',
                                  style: GoogleFonts.nunito(
                                    color: colors.primaryTextColor,
                                    fontSize: 16,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: constants.textFieldPadding,
                      child: TextFormField(
                          controller: _nameController,
                          style: GoogleFonts.montserrat(
                              color: colors.primaryTextColor),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Please enter a valid name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text('Name',
                                style: GoogleFonts.nunito(
                                    color: colors.textBoxTextColor,
                                    fontSize: 17)),
                            filled: true,
                            hintText: 'Enter your name',
                            hintStyle: GoogleFonts.poppins(
                                color: colors.textBoxTextColor),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            fillColor: colors.textBoxColor,
                            focusColor: colors.textBoxColor,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                          )),
                    ),
                    Padding(
                      padding: constants.textFieldPadding,
                      child: TextFormField(
                          controller: _nameController,
                          style: GoogleFonts.montserrat(
                              color: colors.primaryTextColor),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Please enter a valid email";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text('Email',
                                style: GoogleFonts.nunito(
                                    color: colors.textBoxTextColor,
                                    fontSize: 17)),
                            filled: true,
                            hintText: 'Enter your email',
                            hintStyle: GoogleFonts.poppins(
                                color: colors.textBoxTextColor),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            fillColor: colors.textBoxColor,
                            focusColor: colors.textBoxColor,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                                maxLength: 6,
                                keyboardType:
                                const TextInputType.numberWithOptions(),
                                controller: _passwordController,
                                validator: (value) {
                                  if (value == "" || value == null) {
                                    return "Enter OTP";
                                  } else {
                                    return null;
                                  }
                                },
                                style: GoogleFonts.nunito(
                                    color: colors.primaryTextColor,
                                    fontSize: 17),
                                decoration: InputDecoration(
                                  label: Text('Password',
                                      style: GoogleFonts.nunito(
                                          color: colors.textBoxTextColor,
                                          fontSize: 17)),
                                  filled: true,
                                  hintText: 'Password',
                                  hintStyle: GoogleFonts.poppins(
                                      color: colors.textBoxTextColor),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  fillColor: colors.textBoxColor,
                                  focusColor: colors.textBoxColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                )),
                          ),
                          const SizedBox(width: 15,),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                                maxLength: 6,
                                keyboardType:
                                const TextInputType.numberWithOptions(),
                                controller: _passwordController,
                                validator: (value) {
                                  if (value == "" || value == null) {
                                    return "Retype password";
                                  } else {
                                    return null;
                                  }
                                },
                                style: GoogleFonts.nunito(
                                    color: colors.primaryTextColor,
                                    fontSize: 17),
                                decoration: InputDecoration(
                                  label: Text('Retype',
                                      style: GoogleFonts.nunito(
                                          color: colors.textBoxTextColor,
                                          fontSize: 17)),
                                  filled: true,
                                  hintText: 'Retype',
                                  hintStyle: GoogleFonts.poppins(
                                      color: colors.textBoxTextColor),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  fillColor: colors.textBoxColor,
                                  focusColor: colors.textBoxColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text('Sign in instead', style: GoogleFonts.nunito(fontSize: 20, color: colors.primaryTextColor, ),),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          },
                        ),
                      ),),
                    Padding(
                      padding: constants.textFieldPadding,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.google, color: colors.accentTextColor,)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: colors.accentColor),
                              child: Text(
                                'SIGN UP',
                                style: constants.alternateIconTextStyle,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container())
            ],
          ))
    ]);
  }
}
