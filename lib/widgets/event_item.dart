import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/event.dart';

class EventItem extends StatelessWidget {
  final Event event;
  final Function() onDelete;
  final Function()? onTap;
  const EventItem({
    Key? key,
    required this.event,
    required this.onDelete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        event.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        event.date.toString(),
        //style: TextStyle(color: Colors.black54),
      ),
      leading: Icon(
        Icons.arrow_circle_right_outlined,
        size: 35,
        color: Colors.blue,
      ),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
