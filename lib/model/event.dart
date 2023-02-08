import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Event {
  final String title;
  final String? description;
  final DateTime date;
  final String id;

  //wyświetlanie zformatowanej daty
  String releaseDateFormatted() {
    return DateFormat.yMMMMEEEEd().format(date);
  }

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
