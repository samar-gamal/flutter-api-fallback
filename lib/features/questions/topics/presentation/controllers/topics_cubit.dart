import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/topics_model.dart';
import '../../data/repos/topics_repo.dart';
import 'topics_state.dart';


class TopicsCubit extends Cubit<TopicsState> {
  TopicsCubit() : super(TopicsInitial());

  static TopicsCubit get(BuildContext context) => BlocProvider.of(context);

  List<TopicsModel>? topicsData;
  Future<bool> getAllItems(TopicsRepo pro) async {
    emit(TopicsLoading());
    final api = await pro.getTopics();

    final bool state = api.fold((l) {
      emit(TopicsError());
      return false;
    }, (r) {
      topicsData = r;
      emit(TopicsSuccess());
      return true;
    });
    return state;
  }
}
