import 'package:chatt_aplikasi/screens/chatt_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = "REGISTER_SCREEN";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 50,
              child: Image.asset(
                'images/chat.png',
              ),
            // ),
            // SizedBox(
            //   height: 48,
            // ),
            // TextField(
            //   keyboardType: TextInputType.emailAddress,
            //   style: TextStyle(color: Colors.black),
            //   textAlign: TextAlign.center,
            //   onChanged: (value) {
            //     email = value;
            //   },
            //   decoration: InputDecoration(
            //     hintText: 'Enmter Yor emmail',
            //     hintStyle: TextStyle(color: Colors.grey),
            //     contentPadding:
            //         EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide:
            //           BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide:
            //           BorderSide(color: Colors.lightBlueAccent, width: 2.0),
            //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 8),
            //   child: TextField(
            //     obscureText: true,
            //     style: TextStyle(color: Colors.black),
            //     textAlign: TextAlign.center,
            //     onChanged: (value) {
            //       password = value;
            //     },
            //     decoration: InputDecoration(
            //       hintText: 'Enmter Yor pamsword',
            //       hintStyle: TextStyle(color: Colors.grey),
            //       contentPadding:
            //           EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide:
            //             BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            //         borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide:
            //             BorderSide(color: Colors.lightBlueAccent, width: 2.0),
            //         borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 24,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 16),
            //   child: Material(
            //     color: Colors.blueAccent,
            //     borderRadius: BorderRadius.all(Radius.circular(32)),
            //     elevation: 5,
            //     child: MaterialButton(
            //       onPressed: () async {
            //         try {
            //           var newUser = await _auth.createUserWithEmailAndPassword(
            //               email: email, password: password);
            //           if (newUser != null) {
            //             Navigator.pushNamed(context, ChatScreen.id);
            //           }
            //         } catch (e) {
            //           print(e);
            //         }
            //       },
            //       minWidth: 200,
            //       height: 42,
            //       child: Text(
            //         'Register',
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            // )
            )
          ],
        ),
      ),
    );
  }
}
