import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? selectedDate;
  const AddEvent(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      this.selectedDate})
      : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late DateTime _selectedDate;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Event"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputDatePickerFormField(
              firstDate: widget.firstDate,
              lastDate: widget.lastDate,
              initialDate: _selectedDate,
              onDateSubmitted: (date) {
                print(date);
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
          ),
          // Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: FormBuilderDateTimePicker(
          //       name: "date",
          //       initialValue: DateTime.now(),
          //       // widget.selectedDate ?? widget.event?.date ?? DateTime.now(),
          //       initialDate: DateTime.now(),
          //       fieldHintText: "Add Date",
          //       initialDatePickerMode: DatePickerMode.day,
          //       inputType: InputType.date,
          //       format: DateFormat('EEEE, dd MMMM, yyyy'),
          //       decoration: InputDecoration(
          //         contentPadding: EdgeInsets.symmetric(vertical: 10),
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(10)),
          //         prefixIcon: Icon(Icons.calendar_today_rounded),
          //       ),
          const SizedBox(
            height: 15,
          ),
          TextField(
              controller: _titleController,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Event name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          TextField(
              controller: _descController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Description details - How was your workout?',
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
              _addEvent();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _addEvent() async {
    final title = _titleController.text;
    final description = _descController.text;
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    if (title.isEmpty) {
      print('title cannot be empty');
      return;
    }
    await FirebaseFirestore.instance
        .collection(
            'users') // obsługa wielu użytkowników po zalogowaniu każdy ma inne dane
        .doc(userID)
        .collection('events')
        .add({
      "title": title,
      "description": description,
      "date": Timestamp.fromDate(_selectedDate),
    });
    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }
}
