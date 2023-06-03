import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  final String? userID;
  GoalsCubit(this.userID)
      : super(
          const GoalsState(
            documents: [],
            errorMessage: '',
            isLoading: false,
            userID: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const GoalsState(
        documents: [],
        errorMessage: '',
        isLoading: true,
        userID: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection(
            'users') // obsługa wielu użytkowników po zalogowaniu każdy ma inne dane
        .doc(userID)
        .collection('categories')
        .snapshots()
        .listen((data) {
      emit(GoalsState(
        documents: data.docs,
        isLoading: false,
        errorMessage: '',
        userID: '',
      ));
    })
      ..onError((error) {
        emit(
          GoalsState(
            documents: [],
            errorMessage: error.toString(),
            isLoading: true,
            userID: '',
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
