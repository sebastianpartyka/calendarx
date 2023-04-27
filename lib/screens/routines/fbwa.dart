import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Fbwa extends StatefulWidget {
  const Fbwa({super.key});

  @override
  State<Fbwa> createState() => _FbwaState();
}

class _FbwaState extends State<Fbwa> {
  final _controller = YoutubePlayerController(
    initialVideoId: '5JmWguyvu7Y',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      loop: false,
      mute: false,
      forceHD: true,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blue,
          progressColors: const ProgressBarColors(
            playedColor: Colors.blue,
            handleColor: Colors.blue,
          ),
        ),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('FBW A:'),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
            //   bottomNavigationBar: const BottomNavBar(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.topCenter,
                          child: Positioned(
                            left: 10,
                            child: Image.asset(
                              'assets/images/FBW2t.png',
                              height: 270,
                              //width: 200,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 7,
                        child: Image.asset(
                          'assets/images/FBW1t.png',
                          height: 270,
                        ),
                      ),
                      const Positioned(
                        right: 25,
                        bottom: 20,
                        child: Text(
                          'Full Body\nroutine A',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Full Body Workout Routine A',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      border: TableBorder.all(color: Colors.white),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: const [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 75, 205, 1),
                          ),
                          children: [
                            TopEntry('Exercise'),
                            TopEntry('Sets'),
                            TopEntry('Reps'),
                            TopEntry('Rest (min)'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Barbell Bench Press'),
                            ExerciseEntry('3 / 4'),
                            ExerciseEntry('8-10 / 6-8'),
                            ExerciseEntry('2-3'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Barbell Back Squat'),
                            ExerciseEntry('3 / 4'),
                            ExerciseEntry('8-10 / 6-8'),
                            ExerciseEntry('2-3'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Pull-Ups'),
                            ExerciseEntry('3'),
                            ExerciseEntry('6-10'),
                            ExerciseEntry('2-3'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Lying Hamstring DB Curls'),
                            ExerciseEntry('3 / 4'),
                            ExerciseEntry('10-15 / 8-12'),
                            ExerciseEntry('2'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Standing Overhead Press'),
                            ExerciseEntry('3'),
                            ExerciseEntry('6-10'),
                            ExerciseEntry('2-3'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Facepulls'),
                            ExerciseEntry('2 / 4'),
                            ExerciseEntry('10-15'),
                            ExerciseEntry('1.5-2'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Drag Curls'),
                            ExerciseEntry('3'),
                            ExerciseEntry('8-10'),
                            ExerciseEntry('1.5-2'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'If you are more advanced, you can use more sets and less reps',
                    style: TextStyle(fontSize: 11),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Instructional video:',
                    style: TextStyle(fontSize: 30),
                  ),
                  player,
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class TopEntry extends StatelessWidget {
  const TopEntry(
    this.title, {
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ExerciseEntry extends StatelessWidget {
  const ExerciseEntry(
    this.title, {
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
