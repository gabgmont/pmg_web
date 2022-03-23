import 'package:flutter/material.dart';

import 'screens/login/login_page.dart';
import 'screens/user/user_page.dart';

class PmgAssurances extends StatelessWidget {
  const PmgAssurances({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pmg Seguros',
        initialRoute: '/user_page',
        routes: {
          '/login_page': (context) => const LoginPage(),
          '/user_page' : (context) => const UserPage()
        });
  }
}
