import 'package:calendarx/model/quote_model.dart';
import 'package:calendarx/widgets/quote_widget.dart';
import 'package:flutter/material.dart';
import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:meta/meta.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

var apiURL = "https://type.fit/api/quotes";

// DateTime dateToday =
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

// String releaseDateFormatted() {
//   return DateFormat.yMMMMEEEEd().format();
// }

class _Index1State extends State<Index1> {
  late String text;
  late String author;
  String? stringResponse;
  List? listResponse;
  Map? mapResponse;

  Future fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse("https://type.fit/api/quotes"));
    if (response.statusCode == 200) {
      print(response.body);
      // setState(() {
      //   mapResponse = json.decode(response.body);
      // });
    }
  }
  // Future<List<QuoteModel>> getPost() async {
  //   final response = await http.get('$apiURL');
  //   return postFromJson(response.body);
  // }

  // <List<QuoteModel> postFromJson(String str) {
  //   final jsonData = json.decode(str);
  //   return StateData.fromJson(jsonData);
  // }
  @override
  void initState() {
    fetchData();
    super.initState();
  }

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
          QuoteWidget(
              mapResponse.toString(),
              // "Tell me and I forget. Teach me and I remember. Involve me and I learn.",
              "Benjamin Franklin"),
        ],
      ),
    );
  }
}
