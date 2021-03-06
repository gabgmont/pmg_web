import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';

class DateFormField extends StatelessWidget {
  final String label;
  final String date;
  final TextEditingController controller;

  const DateFormField(
      {Key? key,
      required this.label,
      required this.date,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(controller.text.isEmpty){
      controller.text = date;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.reemKufi(fontSize: 18, color: AppColors.primary),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 100,
                child: TextFormField(
                  controller: controller,
                  cursorColor: AppColors.primary,
                  maxLength: 8,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.reemKufi(
                    color: AppColors.primary,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.primary)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: AppColors.primary),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
