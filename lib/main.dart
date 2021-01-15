import 'package:flutter/material.dart';
import 'package:storeaksdk/storeaksdk.dart';
import 'file:///C:/AndroidStudio/fluttre_project/tast_b/lib/screens/HomePage/home_page.dart';
import 'file:///C:/AndroidStudio/fluttre_project/tast_b/lib/screens/Login/login.dart';
import 'package:tast_b/screens/Cart/cart.dart';

void main() {
  StoreakSDK.init(
      clientId: 'd07204ae-4ea4-45c7-b6fb-64969f778ea1',
      clientSecret: '3zsCDFefv54HIRlljzNU1VPEulg60P8R',
      oneSignal: "oneSignal",
      isTest: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blueGrey,

      ),
      home: Login(),
     // home: Cart(),
    );
  }
}
