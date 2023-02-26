import 'package:calendarx/screens/add_achievement.dart';
import 'package:calendarx/screens/goals.dart';
import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:calendarx/model/achievement_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class Achievements extends StatefulWidget {
  const Achievements({super.key});

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements / records:'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddAchievement()));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
      body: StreamBuilderFireAchievement(),

      // ListView(
      //   children: const [
      //     // SizedBox(
      //     //   height: 20,
      //     // ),
      //    // AchievementCard(document['eventname'],['result'],['location']),
      //     // AchievementCard(),
      //     // AchievementCard(),
      //   ],
      // ),
    );
  }
  // Scaffold(
  // appBar: AppBar(
  //   title: const Text('Achievements / records:'),
  //   centerTitle: true,
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.vertical(
  //       bottom: Radius.circular(20),
  //     ),
  //   ),
  // ),
  // bottomNavigationBar: const BottomNavBar(),
  // body: Container(
  //   padding: const EdgeInsets.all(20),
  //   margin: const EdgeInsets.all(7),
  //   decoration: const BoxDecoration(
  //     color: Colors.blue,
  //     borderRadius: BorderRadius.all(
  //       Radius.circular(80),
  //     ),
  //   ),
  //   child: Text(
  //     ('100m'),
  //     style:
  //         const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //   ),

  // ),
  //);
}

class StreamBuilderFireAchievement extends StatelessWidget {
  StreamBuilderFireAchievement({
    Key? key,
  }) : super(key: key);

  //final TextEditingController controller;
  final userID = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(
              'users') // obsługa wielu użytkowników po zalogowaniu każdy ma inne dane
          .doc(userID)
          .collection('achievements')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Unexpected error has occurred');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Please wait, loading the data');
        }

        final documents = snapshot.data!.docs;

        return ListView(
          children: [
            const SizedBox(height: 10),
            for (final document in documents) ...[
              Slidable(
                key: ValueKey(document.id),
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {}),
                      backgroundColor: Colors.green,
                      // foregroundColor: Colors.green,
                      icon: FeatherIcons.edit2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    SlidableAction(
                      onPressed: (context) => {
                        FirebaseFirestore.instance
                            .collection(
                                'users') // obsługa wielu użytkowników po zalogowaniu każdy ma inne dane
                            .doc(userID)
                            .collection('achievements')
                            .doc(document.id)
                            .delete()
                      },
                      backgroundColor: Colors.red,
                      // foregroundColor: Colors.red,
                      icon: Icons.delete,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ],
                ),
                child: AchievementCard(
                  document['eventname'],
                  document['result'],
                  document['location'],
                  //              document['date'],
                ),
              ),
            ],
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            //   child: TextField(
            //     // controller: controller,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //     ),
            //     maxLines: null,
            //   ),
            // ),
          ],
        );
      },
    );
  }
}

class AchievementCard extends StatelessWidget {
  const AchievementCard(
    this.eventname,
    this.result,
    this.location,
    // this.date,
    {
    Key? key,
  }) : super(key: key);

  final String eventname;
  final String result;
  final String location;
  // final DateTime date;

// final   String? description;
// final   String id;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 7,
          ),
          ListTile(
              tileColor: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                // side: BorderSide(width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              leading: const Icon(
                FeatherIcons.award,
                //EvaIcons.awardOutline,
                color: Colors.white,
                size: 40,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      (eventname),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        (result),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                (location),
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                // (date),
                ('20.02.2022'),
                style: TextStyle(fontSize: 15),
              )),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: <Widget>[
          //     TextButton(
          //       child: const Text('BUY TICKETS'),
          //       onPressed: () {/* ... */},
          //     ),
          //     const SizedBox(width: 8),
          //     TextButton(
          //       child: const Text('LISTEN'),
          //       onPressed: () {/* ... */},
          //     ),
          //     const SizedBox(width: 8),
          //   ],
          // ),
        ],
      ),
    );
  }
}

// class AchievementWidget extends StatelessWidget {
//   const AchievementWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
//         // return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//         //   Row(children: [Text("Name"), Spacer(), Text("Abc")]),
//         //   SizedBox(
//         //     height: 20,
//         //   ),
//         //   Row(children: [Text("class"), Spacer(), Text("2nd")])
//         // ]);

//         Container(
//       padding: const EdgeInsets.all(20),
//       margin: const EdgeInsets.all(7),
//       decoration: const BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.all(
//           Radius.circular(80),
//         ),
//       ),
//       child: const Text(
//         ('Tekst tekst tekst badbabfabfab fasdklhfaskl;hfasl;'),
//         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }