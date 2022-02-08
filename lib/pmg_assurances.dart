import 'package:flutter/material.dart';

import 'client/client_page.dart';
import 'login/login_page.dart';

class PmgAssurances extends StatelessWidget {
  const PmgAssurances({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pmg Seguros',
        initialRoute: '/login_page',
        routes: {
          '/login_page': (context) => const LoginPage(),
          '/client_page' : (context) => const ClientPage()
        });
  }
}
