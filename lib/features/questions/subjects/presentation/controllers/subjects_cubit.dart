import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/subjects_model.dart';
import '../../data/repos/subjects_repo.dart';
import 'subjects_state.dart';


class  SubjectsCubit extends Cubit<SubjectsState> {
  SubjectsCubit() : super( SubjectsInitial());

  static SubjectsCubit get(BuildContext context) => BlocProvider.of(context);

  List<SubjectsModel>? subjectsData;
  Future<bool> getAllItems(SubjectsRepo pro) async {
    emit(SubjectsLoading());
    final api = await pro.getSubjects();

    final bool state = api.fold((l) {
      emit(SubjectsError());
      return false;
    }, (r) {
      subjectsData = r;
      emit(SubjectsSuccess());
      return true;
    });
    return state;
  }
}
