import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendarx/model/event.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';


class EditEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final Event event;
  const EditEvent(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      required this.event})
      : super(key: key);

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  late DateTime _selectedDate;
  late TextEditingController _titleController;
  late TextEditingController _descController;
  @override
  void initState() {
    super.initState();
    _selectedDate = widget.event.date;
    _titleController = TextEditingController(text: widget.event.title);
    _descController = TextEditingController(text: widget.event.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Event"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(17),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          //  FormBuilderDateTimePicker(
          //     name: "date",
          //     initialValue: DateTime.now(),
          //     // widget.selectedDate ?? widget.event?.date ?? DateTime.now(),
          //     initialDate: DateTime.now(),
          //     fieldHintText: "Add Date",
          //     initialDatePickerMode: DatePickerMode.day,
          //     inputType: InputType.date,
          //     format: DateFormat('EEEE, dd MMMM, yyyy'),
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.symmetric(vertical: 10),
          //       border:
          //           OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          //       prefixIcon: Icon(Icons.calendar_today_rounded),
          //     ),
          //     valueTransformer: (value) => value.toString(),
          //   ),
          
          // InputDatePickerFormField(
          //   firstDate: widget.firstDate,
          //   lastDate: widget.lastDate,
          //   initialDate: _selectedDate,
          //   onDateSubmitted: (date) {
          //     print(date);
          //     setState(() {
          //       _selectedDate = date;
          //     });
          //   },
          // ),
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
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: _descController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
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
    if (title.isEmpty) {
      print('title cannot be empty');
      return;
    }
    await FirebaseFirestore.instance
        .collection('events')
        .doc(widget.event.id)
        .update({
      "title": title,
      "description": description,
      "date": Timestamp.fromDate(_selectedDate),
    });
    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }
}