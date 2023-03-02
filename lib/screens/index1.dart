import 'package:flutter/material.dart';
import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:meta/meta.dart';

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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Account created:  ${DateFormat('yMMMMd').format(creationTime!)}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Today is: $formatter',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Last sign in: ${DateFormat('dd.MM.yyyy, hh:mm').format(lastSignInTime!)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your email: $userEmail',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your name: $userName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Quote of the day: text text text',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
