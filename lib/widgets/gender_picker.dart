import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_blue_example/utils/constants.dart';
import 'package:flutter_blue_example/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

class GenderPickerWidget extends FormField<String> {
  GenderPickerWidget(
      {Key? key, FormFieldSetter<String>? onSaved,
        Function(String)? onChanged,
        String? initialGender,
        title,
        selectedColor,
        AutovalidateMode autoValidateMode = AutovalidateMode.disabled})
      : super(key: key,
      onSaved: onSaved,
      validator: (data) {
        if (data == null) return "Please choose gender";
        return null;
      },
      initialValue: initialGender ?? MALE,
      autovalidateMode: autoValidateMode,
      builder: (FormFieldState<String> state) {
        onChanged!(state.value ?? MALE);
        return Wrap(

          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runSpacing: 4.0,
          children: [
            GenderWidget(
                gender: MALE,
                assetPath: "assets/svg/male.svg",
                state: state,
                successColor: selectedColor,
                onChanged: onChanged),
            GenderWidget(
                gender: FEMALE,
                assetPath: "assets/svg/female.svg",
                state: state,
                successColor: selectedColor,
                onChanged: onChanged),
            GenderWidget(
                gender: OTHER,
                assetPath: "assets/svg/transgender.svg",
                state: state,
                successColor: selectedColor,
                onChanged: onChanged),
          ],
        );
      });
}

//assets/avatar_man.png
//assets/avatar_woman.png
class GenderWidget extends StatelessWidget {
  const GenderWidget({
    Key? key,
    required this.state,
    required this.gender,
    required this.assetPath,
    this.successColor,
    this.onChanged,
  }) : super(key: key);

  final state;
  final gender;
  final assetPath;
  final successColor;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.didChange(gender);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            maxRadius: 25,
            backgroundColor: state.value == gender
                ? successColor ?? colors.successColor
                : Colors.transparent,
            child: ClipOval(
              child: SvgPicture.asset(assetPath),
            ),
          ),
          Container(
            child: Padding(
                padding: EdgeInsets.only(left: 4, right: 15),
                child: Chip(
                  backgroundColor: state.value == gender ? successColor ?? colors.successColor : colors.scaffoldColor,
                  label: Text(gender),
                  labelStyle: GoogleFonts.poppins(fontSize: 13,color: colors.scaffoldColor,fontWeight: state.value == gender ? FontWeight.bold : FontWeight.normal),
                )),
          )
        ],
      ),
    );
  }
}
//"assets/avatar_woman.png"
