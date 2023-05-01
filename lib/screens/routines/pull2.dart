import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Pull2 extends StatefulWidget {
  const Pull2({super.key});

  @override
  State<Pull2> createState() => _Pull2State();
}

class _Pull2State extends State<Pull2> {
  final _controller = YoutubePlayerController(
    initialVideoId: 'tPphF8gepd8',
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
              title: const Text('Pull 2:'),
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
                              'assets/images/Pull2t.png',
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
                          'assets/images/Pull1t.png',
                          height: 270,
                        ),
                      ),
                      const Positioned(
                        right: 15,
                        bottom: 20,
                        child: Text(
                          'Pull Workout\nroutine 2',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Pull Workout Routine 2',
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
                            ExerciseEntry('Pull-Ups OR Kneeling Lat Pulldowns'),
                            ExerciseEntry('3-4'),
                            ExerciseEntry('6-10 OR 10-15'),
                            ExerciseEntry('2-2.5'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Barbell Row'),
                            ExerciseEntry('3-4'),
                            ExerciseEntry('10-15'),
                            ExerciseEntry('2-2.5'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Reverse Grip Lat Pulldowns'),
                            ExerciseEntry('3-4'),
                            ExerciseEntry('8-12'),
                            ExerciseEntry('2'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Chest Supported Rear Delt Row'),
                            ExerciseEntry('3-4'),
                            ExerciseEntry('10-15'),
                            ExerciseEntry('2'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Narrow Grip Barbell Curl'),
                            ExerciseEntry('2-3'),
                            ExerciseEntry('8-12'),
                            ExerciseEntry('1.5-2'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Kneeling Face Pulls'),
                            ExerciseEntry('2'),
                            ExerciseEntry('10-15'),
                            ExerciseEntry('1.5'),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          children: [
                            ExerciseEntry('Lying Face Pulls'),
                            ExerciseEntry('2'),
                            ExerciseEntry('10-15'),
                            ExerciseEntry('1.5'),
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
