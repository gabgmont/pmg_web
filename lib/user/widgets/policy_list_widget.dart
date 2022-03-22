import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmg_project/Utils/app_colors.dart';

class PolicyListWidget extends StatelessWidget {
  const PolicyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Expanded(
              child: Container(
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
                      Icon(
                        Icons.search_outlined,
                        color: AppColors.primary,
                        size: 26,
                      ),
                      SizedBox(
                        width: size.width * .3 - 42,
                        child: TextFormField(
                          scrollPadding: EdgeInsets.zero,
                          cursorColor: AppColors.primary,
                          cursorHeight: 29,
                          style: GoogleFonts.reemKufi(),
                          decoration: InputDecoration(
                              hintText: "Número, Nome",
                              hintStyle: GoogleFonts.reemKufi(),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Suas Apólices",
                style:
                    GoogleFonts.reemKufi(color: AppColors.primary, fontSize: 28),
              ),
            ),
            Expanded(child: SizedBox())
          ])
        ],
      ),
    );
  }
}
