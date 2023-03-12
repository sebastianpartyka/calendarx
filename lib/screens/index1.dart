import 'package:flutter/material.dart';
import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:meta/meta.dart';
import 'package:google_fonts/google_fonts.dart';

// class UserMetadata {
//   // ignore: public_member_api_docs
//   @protected
//   UserMetadata(this._creationTimestamp, this._lastSignInTime);

//   final int? _creationTimestamp;
//   final int? _lastSignInTime;

//   /// When this account was created as dictated by the server clock.
//   DateTime? get creationTime => _creationTimestamp == null
//       ? null
//       : DateTime.fromMillisecondsSinceEpoch(_creationTimestamp!);

//   /// When the user last signed in as dictated by the server clock.
//   ///
//   /// This is only accurate up to a granularity of 2 minutes for consecutive
//   /// sign-in attempts.
//   DateTime? get lastSignInTime => _lastSignInTime == null
//       ? null
//       : DateTime.fromMillisecondsSinceEpoch(_lastSignInTime!);

//   @override
//   String toString() {
//     return 'UserMetadata(creationTime: ${creationTime.toString()}, lastSignInTime: ${lastSignInTime.toString()})';
//   }
// }

class Index1 extends StatefulWidget {
  const Index1({super.key});

  @override
  State<Index1> createState() => _Index1State();
}

// extension MyDateExtension on DateTime {
//   DateTime getDateOnly() {
//     return DateTime(year, month, day);
//   }
// }

// var user = FirebaseAuth.currentUser;
// var signupDate = new Date(user.metadata.creationTime);

// DateTime dateOnly = now.getDateOnly();
final now = DateTime.now();
String formatter = DateFormat.yMMMMd().format(now);
final userEmail = FirebaseAuth.instance.currentUser?.email;
final userName = FirebaseAuth.instance.currentUser!.displayName;
final creationTime = FirebaseAuth.instance.currentUser?.metadata.creationTime;
final lastSignInTime =
    FirebaseAuth.instance.currentUser?.metadata.lastSignInTime;

// DateTime dateToday =
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

// String releaseDateFormatted() {
//   return DateFormat.yMMMMEEEEd().format();
// }

class _Index1State extends State<Index1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook index:'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Account created: ${DateFormat('yMMMMd').format(creationTime!)}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Today is: $formatter',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Last sign in: ${DateFormat('dd.MM.yyyy, hh:mm').format(lastSignInTime!)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your email: $userEmail',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your name: $userName',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width, //cała szerokość ekranu
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Tell me and I forget. Teach me and I remember. Involve me and I learn.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Ubuntu-Regular',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Benjamin Franklin',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
