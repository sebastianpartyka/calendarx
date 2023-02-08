import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          // SizedBox(
          //   height: 20,
          // ),
          AchievementCard(),
          AchievementCard(),
          AchievementCard(),
        ]),
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
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('LISTEN'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
