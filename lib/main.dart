import 'package:flutter/material.dart';
import 'Features/Login/ui/login_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green,iconTheme: IconThemeData(color: Colors.white),titleTextStyle: TextStyle(color: Colors.white,fontSize: 25))
      ),
      home: const LoginPage(),
    );
  }
}
