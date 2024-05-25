import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note2/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sam extends StatefulWidget {
  const sam({super.key});

  @override
  State<sam> createState() => _samState();
}

// ignore: camel_case_types
class _samState extends State<sam> {
  // ignore: use_function_type_syntax_for_parameters

  late final TextEditingController _email;

  late final TextEditingController _password;
  void storedata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final ema = pref.setString("email", _email.text);
    print("storedata...$ema");
  }

  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool isverify = false;
  void sigin() async {
    try {
      // final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: _email.text.trim(), password: _password.text.trim());
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text.trim(), password: _password.text.trim());
      // if (userCredential == null) {
      //   print("ok");
      // } else {
      //   print("no");
      // }
      // print(result);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      print("ss");
      //   }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "email:",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Container(
              child: Text(
                "passord",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () async {
                      sigin();
                      storedata();
                      // final mobile =
                      // _email.text.trim();
                      // registerUser(mobile, context);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text('submit'))),
            // ElevatedButton(
            //     onPressed: () {
            //       ok = !ok;
            //       print("$ok");
            //       ok == true
            //           ? changeTheme(ThemeMode.light)
            //           : changeTheme(ThemeMode.dark);
            //     },
            //     child: Text('Light theme')),
          ],
        ),
      ),
    );
  }
}
