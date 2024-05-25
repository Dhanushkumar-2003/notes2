import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note2/home.dart';
import 'package:note2/new.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String email = '';
  String e = '';
  Future shared() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    email = pref.getString('email')!;
    print("EMAIL...>>>>>$email");
    // ignore: unnecessary_null_comparison
    if (email != null) {
      print("EL...>>>>>$email");

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const sam()));
      print("IL...>>>>>$email");
    }
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => const sam()));
    // return email;
  }

  @override
  void initState() {
    // shared();
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => email == ""
            ? Navigator.push(
                context, MaterialPageRoute(builder: (context) => const sam()))
            : Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Home())));
    print("IL...>>>>>$email");
    print("POK");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Image(image: AssetImage('image/not.jpg'))),
          Text(
            'welcome to TO-DO list',
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
