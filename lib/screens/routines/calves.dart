import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Calves extends StatefulWidget {
  const Calves({super.key});

  @override
  State<Calves> createState() => _CalvesState();
}

class _CalvesState extends State<Calves> {
  final List<YoutubePlayerController> _controllers = [
    YoutubePlayerController(
      initialVideoId: 'IlwqocM10GY',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    ),
    YoutubePlayerController(
      initialVideoId: '6xeFf7VHUdU',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    ),
    YoutubePlayerController(
      initialVideoId: '-qsRtp_PbVM',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    ),
  ];

  // final _controller = YoutubePlayerController(
  //   initialVideoId: 'sDCFiqyt_Rs',
  //   flags: const YoutubePlayerFlags(
  //     autoPlay: false,
  //     loop: false,
  //     mute: false,
  //     forceHD: true,
  //   ),
  // );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: _controllers.length,
    //   itemBuilder: (context, index) {
    //     return YoutubePlayer(
    //       controller: _controllers[index],
    //       showVideoProgressIndicator: true,
    //     );
    //   },
    // );

    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controllers[0],
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
              title: const Text('Calves & Shins:'),
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
                              'assets/images/abs2t.png',
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
                          'assets/images/abs1t.png',
                          height: 270,
                        ),
                      ),
                      const Positioned(
                        right: 15,
                        bottom: 20,
                        child: Text(
                          'Calves & Shins Workout\nroutines',
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
                    'Calves & Shins Workout Routines',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Table(
                  //     border: TableBorder.all(color: Colors.white),
                  //     defaultVerticalAlignment:
                  //         TableCellVerticalAlignment.middle,
                  //     children: const [
                  //       TableRow(
                  //         decoration: BoxDecoration(
                  //           color: Color.fromRGBO(50, 75, 205, 1),
                  //         ),
                  //         children: [
                  //           TopEntry('Exercise'),
                  //           TopEntry('Sets'),
                  //           TopEntry('Reps'),
                  //           TopEntry('Rest (min)'),
                  //         ],
                  //       ),
                  //       TableRow(
                  //         decoration: BoxDecoration(
                  //           color: Colors.blueAccent,
                  //         ),
                  //         children: [
                  //           ExerciseEntry('Deadlift'),
                  //           ExerciseEntry('4'),
                  //           ExerciseEntry('4-6'),
                  //           ExerciseEntry('2-3'),
                  //         ],
                  //       ),
                  //       TableRow(
                  //         decoration: BoxDecoration(
                  //           color: Colors.blueAccent,
                  //         ),
                  //         children: [
                  //           ExerciseEntry(
                  //               'Bulgarian Split Squat OR Walking Lunges'),
                  //           ExerciseEntry('4'),
                  //           ExerciseEntry('8-10 OR 7-9'),
                  //           ExerciseEntry('2-3'),
                  //         ],
                  //       ),
                  //       TableRow(
                  //         decoration: BoxDecoration(
                  //           color: Colors.blueAccent,
                  //         ),
                  //         children: [
                  //           ExerciseEntry(
                  //               'Squat Machine OR Romanian Dumbbell Deadlift'),
                  //           ExerciseEntry('4'),
                  //           ExerciseEntry('8-10 OR 7-9'),
                  //           ExerciseEntry('2'),
                  //         ],
                  //       ),
                  //       TableRow(
                  //         decoration: BoxDecoration(
                  //           color: Colors.blueAccent,
                  //         ),
                  //         children: [
                  //           ExerciseEntry('Standing OR Seated Calf Raises'),
                  //           ExerciseEntry('3-4'),
                  //           ExerciseEntry('15-20'),
                  //           ExerciseEntry('2'),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const Text(
                  //   'If you are more advanced, you can use more sets and less reps',
                  //   style: TextStyle(fontSize: 11),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Instructional videos:',
                    style: TextStyle(fontSize: 30),
                  ),
                  //player,
                  const SizedBox(
                    height: 20,
                  ),
                  // ListView.builder(
                  //   itemBuilder: (context, index) {
                  //     return YoutubePlayer(controller: _controllers[index]);
                  //   },
                  // )
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controllers.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          YoutubePlayer(
                            controller: _controllers[index],
                            showVideoProgressIndicator: true,
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    },
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
