import 'package:flutter/material.dart';
import 'package:chatt_aplikasi/screens/welcome_screen.dart';
import 'package:chatt_aplikasi/screens/chatt_screen.dart';
import 'package:chatt_aplikasi/screens/registration_screen.dart';
import 'package:chatt_aplikasi/screens/login_screen.dart';
import 'package:chatt_aplikasi/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        RegisterScren.id: (context) => RegisterScren(),
      },
    );
  }
}
