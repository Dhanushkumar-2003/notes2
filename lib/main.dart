import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note2/home.dart';
// import 'package:note2/login.dart';
import 'package:note2/new.dart';
import 'package:note2/provider.dart';
import 'package:note2/splash.dart';
import 'package:path/path.dart';
// import 'package:notes/home.dart';
// import 'package:notes/login.dart';
// import 'package:notes/provider.dart';
// import 'package:notes/home.dart';
// import 'package:notes/splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void ok() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    var ok = prefs?.getString("email");
    print("set................===$ok");
    if (ok == null) {
      // Lo/
      print("emtuy found");
    } else {
      print("value found,........==========.=.=======");

      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  void initstate() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.brown, secondaryHeaderColor: Colors.red),

        // standard dark theme

        // themeMode: ui().changetheme(),
        home: enter());
  }
}

// ignore: unused_element
class enter extends StatefulWidget {
  const enter({super.key});

  @override
  State<enter> createState() => _enterState();
}

class _enterState extends State<enter> {
  String email = '';
  String e = '';
  Future shared() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    email = pref.getString('email')!;
    print("EMAIL...>>>>>$email");
    // ignore: unnecessary_null_comparison
    if (email != null) {
      print("EL...>>>>>$email");
      setState(() {});
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      Navigator.push(context as BuildContext,
          MaterialPageRoute(builder: (context) => const sam()));
      print("IL...>>>>>$email");
    }
    // return email;
  }

  @override
  void initState() {
    shared();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(),
      // ignore: unnecessary_null_comparison
      body: Splash(),
    );
  }
}
