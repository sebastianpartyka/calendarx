import 'package:calendarx/screens/routines/FBWa.dart';
import 'package:calendarx/screens/routines/fbwb.dart';
import 'package:calendarx/screens/routines/push.dart';
import 'package:flutter/material.dart';
import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          children: [
            RoutineTile(Fbwa(), 'FBW A'),
            RoutineTile(Fbwb(), 'FBW B'),
            RoutineTile(Push(), 'Push'),
            NewRoutine(
              child: 'Pull',
            ),
            NewRoutine(
              child: 'Legs 1',
            ),
            NewRoutine(
              child: 'Legs 2',
            ),
            NewRoutine(
              child: '',
            ),
            NewRoutine(
              child: '',
            ),
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
