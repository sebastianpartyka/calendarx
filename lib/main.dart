import 'package:calendarx/features/auth/pages/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './firebase_options.dart';
import 'screens/home_page.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: []); // remove status bar
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.blue, // transparent status bar
  // ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]); //hide bottom bar (include the top)

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  //   SystemUiOverlay.bottom,
  //   SystemUiOverlay.top
  // ]); //pokazanie na nowo paska na górze w iOS
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const AuthGate(),
      //const MyHomePage(),
    );
  }
}
