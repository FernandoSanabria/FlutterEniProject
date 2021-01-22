import 'package:flutter/material.dart';
import 'package:neiproject2021/page/home_products_admin_page.dart';
import 'package:neiproject2021/page/login_page.dart';


Map<String, WidgetBuilder> generalRoute(){
return <String, WidgetBuilder> {
  '/': (BuildContext context) => Login(),
  'home': (BuildContext context) => HomeProductsAdmin(),
};

}