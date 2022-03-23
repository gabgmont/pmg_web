import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';

class LoginTextFieldWidget extends StatelessWidget {
  final String hint;
  const LoginTextFieldWidget({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: AppColors.white,
        width: 350,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            style: GoogleFonts.reemKufi(fontSize: 28, color: AppColors.primary),
            cursorColor: AppColors.primary,
            cursorHeight: 45,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.reemKufi(fontSize: 36, color: AppColors.lightGray),
                border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}
