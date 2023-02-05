import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Event {
  final String title;
  final String? description;
  final DateTime date;

  String releaseDateFormatted() {
    return DateFormat.yMMMMEEEEd().format(date);
  }

  // readDate(Timestamp dateTime) {
  //   DateTime data = DateTime.parse(dateTime.toDate().toString());
  //   String formatedDate = DateFormat.yMMMMEEEEd().format(data);
  //   return formatedDate;
  // }

  // wyświetlanie daty do zrobienia
  // final formattedDate = DateFormat.yMMMMEEEEd(DateTime.now());
  // ('EEEE, dd MMMM, yyyy');

  final String id;
  Event({
    required this.title,
    this.description,
    required this.date,
    required this.id,
  });

  factory Event.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data()!;
    return Event(
      date: data['date'].toDate(),
      title: data['title'],
      description: data['description'],
      id: snapshot.id,
    );
  }

  Map<String, Object?> toFirestore() {
    return {
      "date": Timestamp.fromDate(date),
      "title": title,
      "description": description
    };
  }
}
