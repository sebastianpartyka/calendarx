import 'package:cloud_firestore/cloud_firestore.dart';

class Achievement {
  String eventname;
  String result;
  final DateTime date;
  String? location;
  String? description;
  String id;

  Achievement({
    required this.eventname,
    required this.result,
    required this.date,
    this.location,
    this.description,
    required this.id,
  });

  //Map<String, dynamic> ToFirestore() {
  Map<String, Object?> ToFirestore() {
    return {
      'date': Timestamp.fromDate(date),
      'eventname': eventname,
      'result': result,
      'location': location,
      'description': description,
    };
  }

  factory Achievement.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data()!;
    return Achievement(
      date: data['date'].toDate(),
      eventname: data['eventname'],
      result: data['result'],
      location: data['location'],
      description: data['description'],
      id: snapshot.id,
    );
  }


}
