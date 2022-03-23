
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import 'widgets/login_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: AppColors.primary,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage(AppImages.pmgLogo)),
                    borderRadius: BorderRadius.circular(200)),
              ),
              const SizedBox(
                width: 40,
              ),
              SizedBox(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Faça seu login',
                      style:
                      GoogleFonts.reemKufi(fontSize: 48, color: Colors.white),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: LoginTextFieldWidget(
                        hint: 'Usuario',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: LoginTextFieldWidget(
                        hint: 'Senha',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Material(
                        color: AppColors.white,
                        child: InkWell(
                          hoverColor: AppColors.hoverPrimary,
                          onTap: (){},
                          child: Container(
                            width: 200,
                            height: 60,
                            child: Center(child: Text('Entrar', style: GoogleFonts.reemKufi(fontSize: 36, color: AppColors.primary),)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
