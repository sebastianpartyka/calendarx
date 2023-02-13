import 'package:calendarx/screens/goals.dart';
import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
      body: ListView(
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          AchievementCard(),
          AchievementCard(),
          AchievementCard(),
          AchievementWidget(),
          AchievementWidget(),
          AchievementWidget(),
          AchievementWidget(),
          AchievementWidget(),
          AchievementWidget(),
          AchievementWidget(),
          AchievementWidget(),
          AchievementWidget(),
          AchievementWidget(),
        ],
      ),
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

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 7,
          ),
          ListTile(
              tileColor: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                // side: BorderSide(width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              leading: Icon(
                FeatherIcons.award,
                color: Colors.white,
                size: 40,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  '100 m',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              subtitle: Text(
                'XXV Bieg Solidarności',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                '20.02.2022',
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

class AchievementWidget extends StatelessWidget {
  const AchievementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        //   Row(children: [Text("Name"), Spacer(), Text("Abc")]),
        //   SizedBox(
        //     height: 20,
        //   ),
        //   Row(children: [Text("class"), Spacer(), Text("2nd")])
        // ]);

        Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(7),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(80),
        ),
      ),
      child: Text(
        ('Tekst tekst tekst badbabfabfab fasdklhfaskl;hfasl;'),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
