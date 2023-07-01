import 'package:calendarx/screens/routines/FBWa.dart';
import 'package:calendarx/screens/routines/abs.dart';
import 'package:calendarx/screens/routines/fbwb.dart';
import 'package:calendarx/screens/routines/legs3.dart';
import 'package:calendarx/screens/routines/push.dart';
import 'package:calendarx/screens/routines/pull.dart';
import 'package:calendarx/screens/routines/push2.dart';
import 'package:calendarx/screens/routines/pull2.dart';
import 'package:calendarx/screens/routines/legs.dart';
import 'package:calendarx/screens/routines/legs2.dart';
import 'package:calendarx/screens/routines/forearms.dart';
import 'package:calendarx/screens/routines/calves.dart';
import 'package:flutter/material.dart';

class Routines extends StatefulWidget {
  const Routines({super.key});

  @override
  State<Routines> createState() => _RoutinesState();
}

class _RoutinesState extends State<Routines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Routines:'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        //bottomNavigationBar: const BottomNavBar(),
        body: GridView.count(
          crossAxisCount: 2,
          children: const [
            RoutineTile(Fbwa(), 'FBW A'),
            RoutineTile(Fbwb(), 'FBW B'),
            RoutineTile(Push(), 'Push 1'),
            RoutineTile(Pull(), 'Pull 1'),
            RoutineTile(Push2(), 'Push 2'),
            RoutineTile(Pull2(), 'Pull 2'),
            RoutineTile(Legs(), 'Legs 1'),
            RoutineTile(Legs2(), 'Legs 2'),
            RoutineTile(Legs3(), 'Legs 3'),
            RoutineTile(Abs(), 'ABS'),
            RoutineTile(Forearms(), 'Forearms'),
            RoutineTile(Calves(), 'Calves & Shins'),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       color: Colors.blue,
            //     ),
            //   ),
            // ),
          ],
        )
        // Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        //   const SizedBox(
        //     height: 20,
        //   ),
        //   Center(
        //     child: Text(
        //       'Routines',
        //       style: const TextStyle(fontSize: 20),
        //     ),
        //   ),
        // ],
        // ),

        );
  }
}

class RoutineTile extends StatelessWidget {
  const RoutineTile(
    this.link1,
    this.title, {
    super.key,
  });

  // ignore: prefer_typing_uninitialized_variables
  final link1;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: const Color.fromRGBO(50, 75, 205, 1),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => link1,
          ),
        );
      },
      child: NewRoutine(
        child: title,
      ),
    );
  }
}

class NewRoutine extends StatelessWidget {
  const NewRoutine({
    super.key,
    required this.child,
    this.image,
  });

  final String child;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Ink(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  (child),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 20,
                height: 90,
                width: 90,
                child: Image.asset(
                  'assets/images/hantelTransparent.png',
                  fit: BoxFit.cover,
                  height: 30,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   child: Image.asset('assets/images/hantelTransparent.png'),
          // )
        ),
      ),
    );
  }
}
