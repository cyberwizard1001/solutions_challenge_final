import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_blue_example/utils/colors.dart' as colors;

const textFieldPadding = EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10);
var alternateIconTextStyle = GoogleFonts.nunito(color: colors.accentTextColor, fontWeight: FontWeight.bold, fontSize: 17);
var iconTextStyle = GoogleFonts.nunito(color: colors.accentTextColor, fontWeight: FontWeight.bold, fontSize: 17);
var textNormalStyle = GoogleFonts.nunito(color: colors.primaryTextColor, fontSize: 17);

final String MALE = "Male";
final String FEMALE = "Female";
final String OTHER = "Other";