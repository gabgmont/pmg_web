import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Container(
      height: 60,
      width: size.width,
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(500)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          image: const DecorationImage(image: AssetImage(AppImages.pmgLogo))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Pmg Seguros", style: GoogleFonts.reemKufi(fontSize: 18, color: AppColors.primary,)),
                    )
                  ],
                ),
              ),
            ),
            IconButton(padding: EdgeInsets.zero,onPressed: (){}, icon: Icon(Icons.logout, size: 40, color: AppColors.white,))
          ],
        ),
      ),
    );
  }
}
