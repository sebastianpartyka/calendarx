import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onDelete(),
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          event.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          event.releaseDateFormatted(),
          //event.date.toString(), default
          style: TextStyle(color: Colors.indigo.shade900),
        ),
        leading: const Icon(
          Icons.arrow_circle_right_outlined,
          size: 40,
          color: Colors.blue,
        ),
        onTap: onTap,
        // trailing: IconButton(
        //   icon: const Icon(Icons.delete),
        //   onPressed: onDelete,
        // ),
      ),
    );
  }
}
