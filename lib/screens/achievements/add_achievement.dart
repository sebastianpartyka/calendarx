import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAchievement extends StatefulWidget {
  const AddAchievement({super.key});
  @override
  State<AddAchievement> createState() => _AddAchievementState();
}

class _AddAchievementState extends State<AddAchievement> {
  final _ctreventname = TextEditingController();
  final _ctrresult = TextEditingController();
  //  final _ctrdate = TextEditingController();
  final _ctrlocation = TextEditingController();
  final _ctrdescription = TextEditingController();

  var _selectedDate;
  // DateTime _dateTime = DateTime.now();
  // late final _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Achievement"),
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
          //     },
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
                  initialValue: DateTime.now(),
                  // widget.selectedDate ?? widget.event?.date ?? DateTime.now(),
                  initialDate: DateTime.now(),
                  fieldHintText: "Add Date",
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
                  // onChanged:
                  //  (val) { _addAchievement(val); }

                  // (val) {
                  //   _addAchievement();
                  // }

                  // (val) {
                  // print(val);
                  // _addAchievement(val);
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
              _addAchievement();
              // print _dateTime;
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _addAchievement() async {
    final eventname = _ctreventname.text;
    final result = _ctrresult.text;
    //   final _ctrdate = TextEditingController();
    final location = _ctrlocation.text;
    final description = _ctrdescription.text;
    final date = _selectedDate;
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
        .add({
      "eventname": eventname,
      "result": result,
      "location": location,
      "description": description,
      "date": Timestamp.fromDate(date),
    });
    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }
}
