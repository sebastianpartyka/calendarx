import 'package:calendarx/screens/home_page.dart';
//import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(primary: Colors.indigo.shade900),
              // colorScheme: Theme.of(context).colorScheme.copyWith(
              //       secondary: Colors
              //           .black, //Color.fromARGB(255, 63, 136, 195)he AuthActionSwitch
              //     ),
              // primaryColor: Colors.black,
              // textTheme: TextTheme(titleLarge: TextStyle(color: Colors.red)),
              scaffoldBackgroundColor: Colors.blue.shade300,
              inputDecorationTheme: InputDecorationTheme(
                fillColor: Colors.white,
                filled: true,
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.black),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red),
                // ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(24),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo.shade700),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo.shade900),
                ),
              ),
            ),
            home: SignInScreen(
              providerConfigs: const [EmailProviderConfiguration()],
              headerBuilder: (context, constraints, _) {
                return Image.asset(
                  'assets/images/splashlogin.png',
                  // width: 1000, // Adjust the width as per your requirements
                  // height: 1000, // Adjust the height as per your requirements
                );
              },
              //headerImage('assets/images/flutterfire_logo.png'),
              // headerBuilder: (context, constraints, _)
              //   padding: EdgeInsets.all(20),
              //   child: AspectRatio(aspectRatio: 1,
              //   child: AssetImage('assetName'),)
            ),
          );
        }

        // Render your application if authenticated
        return const MyHomePage();
      },
    );
  }
}
