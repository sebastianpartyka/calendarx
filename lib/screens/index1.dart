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
      body: Column(
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
            width: 380,
            //MediaQuery.of(context).size.width, //ca??a szeroko???? ekranu
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              //  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(right: 300),
                  child: Image(
                    image: AssetImage('assets/images/quote.png'),
                    height: 30,
                    width: 30,
                    color: Colors.white,
                    alignment: Alignment.topLeft,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Tell me and I forget. Teach me and I remember. Involve me and I learn.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                  // style: TextStyle(
                  //     fontSize: 20,
                  //     color: Colors.white,
                  //     // fontFamily: 'Ubuntu-Regular',
                  //     fontFamily: 'Ubuntu-Medium',
                  //     fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'Benjamin Franklin',
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
