import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';


const defaultHint = 'Pesquisar';

class SearchBarWidget extends StatelessWidget {
  final String hint;
  final TextEditingController textController;

  const SearchBarWidget(
      {Key? key, this.hint = defaultHint, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(500),
          boxShadow: [
            BoxShadow(
                offset: Offset.fromDirection(1, 1),
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 1)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            const Icon(
              Icons.search_outlined,
              color: AppColors.primary,
              size: 26,
            ),
            Expanded(
              child: TextFormField(
                controller: textController,
                scrollPadding: EdgeInsets.zero,
                cursorColor: AppColors.primary,
                cursorHeight: 23,
                style: GoogleFonts.reemKufi(),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: hint,
                    hintStyle: GoogleFonts.reemKufi(),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
