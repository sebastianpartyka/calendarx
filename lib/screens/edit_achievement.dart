import 'package:calendarx/model/achievement_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:cloud_firestore/cloud_firestore.dart';

// class EditAchievement extends StatefulWidget {
//   const EditAchievement({super.key});
//   @override
//   State<EditAchievement> createState() => _EditAchievementState();
// }

class EditAchievement extends StatefulWidget {
  // final DateTime firstDate;
  // final DateTime lastDate;
  // final Achievement achievement;
  // final Achievement document;

  const EditAchievement({
    Key? key,
    // required this.firstDate,
    // required this.lastDate,
    required this.document,
    //     required this.eventID,
  }) : super(key: key);
  // final Map<String, dynamic> document;
  final QueryDocumentSnapshot<Object?> document;
//  final String eventID;

  @override
  State<EditAchievement> createState() => _EditAchievementState();
}

class _EditAchievementState extends State<EditAchievement> {
  late TextEditingController _ctreventname;
  late TextEditingController _ctrresult;
  late TextEditingController _ctrlocation;
  late TextEditingController _ctrdescription;
  var _selectedDate;
  //late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.document['date'];
    _ctreventname = TextEditingController(text: widget.document['eventname']);
    _ctrresult = TextEditingController(text: widget.document['result']);
    _ctrlocation = TextEditingController(text: widget.document['location']);
    _ctrdescription =
        TextEditingController(text: widget.document['description']);
  }

  // final _ctrresult = TextEditingController();
  // final _ctrdate = TextEditingController();
  // final _ctrlocation = TextEditingController();
  // final _ctrdescription = TextEditingController();

  //var _selectedDate;
  // DateTime _dateTime = DateTime.now();
  // late final _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Achievement"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
              controller: _ctreventname,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: "Event's name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          TextField(
              controller: _ctrresult,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Result',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InputDatePickerFormField(
          //     firstDate: widget.firstDate,
          //     lastDate: widget.lastDate,
          //     initialDate: _selectedDate,
          //     onDateSubmitted: (date) {
          //       print(date);
          //       setState(() {
          //  //       _selectedDate = date;
          //       });
          //     },s
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //Text(_dateTime.toIso8601String()),
                /////////
                FormBuilderDateTimePicker(
                  name: "date",
                  initialValue: _selectedDate.toDate(),
                  // widget.selectedDate ?? widget.event?.date ?? DateTime.now(),
                  initialDate: DateTime.now(),
                  fieldHintText: "Edit Date",
                  initialDatePickerMode: DatePickerMode.day,
                  inputType: InputType.date,
                  format: DateFormat('EEEE, dd MMMM, yyyy'),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: const Icon(Icons.calendar_today_rounded),
                  ),
                  onChanged: (val) => {
                    //  print(val);
                    setState(() {
                      _selectedDate = val;
                    })
                  },
                  // onChanged: ((val) => (_selectedDate) {
                  //       print(_selectedDate);
                  //       setState(() {
                  //         _selectedDate = val;
                  //       });
                  //     }),
                  //     onChanged: (val) { _editAchievement(val); }

                  // (val) {
                  //   _editAchievement();
                  // }

                  // (val) {
                  // print(val);
                  // _editAchievement(val);
                  // },
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          TextField(
              controller: _ctrlocation,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          TextField(
              controller: _ctrdescription,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Description details - if needed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.blue)))),
            onPressed: () {
              _editAchievement();
              // print _dateTime;
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _editAchievement() async {
    final eventname = _ctreventname.text;
    final result = _ctrresult.text;
    // final _ctrdate = TextEditingController();
    final location = _ctrlocation.text;
    final description = _ctrdescription.text;
    final date = _selectedDate.toDate();
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    if (eventname.isEmpty) {
      print("Event's name cannot be empty");
      return;
    }
    await FirebaseFirestore.instance
        .collection(
            'users') // obsługa wielu użytkowników po zalogowaniu każdy ma inne dane
        .doc(userID)
        .collection('achievements')
        .doc(widget.document.id)
        .update({
      "eventname": eventname,
      "result": result,
      "location": location,
      "description": description,
      "date": date, //Timestamp.fromDate(date),
    });
    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }
}
