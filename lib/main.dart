import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neiproject2021/bloc/provider.dart';
import 'package:neiproject2021/page/home_products_admin_page.dart';
import 'package:neiproject2021/page/login_page.dart';
import 'package:neiproject2021/route/general_route.dart';
import 'package:neiproject2021/service/login_service.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var doomie = LoginService();
    // doomie.sendRequest();

    return Provider(
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: generalRoute()
        )

    );
    
  }
}
