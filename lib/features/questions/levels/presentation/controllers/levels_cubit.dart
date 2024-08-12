import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/levels_model.dart';
import '../../data/repos/levels_repo.dart';
import 'levels_state.dart';


class LevelsCubit extends Cubit<LevelsState> {
  LevelsCubit() : super(LevelsInitial());

  static LevelsCubit get(BuildContext context) => BlocProvider.of(context);

  List<LevelsModel>? levelsData;
  Future<bool> getAllItems(LevelsRepo pro) async {
    emit(LevelsLoading());
    final api = await pro.getLevels();

    final bool state = api.fold((l) {
      emit(LevelsError());
      return false;
    }, (r) {
      levelsData = r;
      emit(LevelsSuccess());
      return true;
    });
    return state;
  }
}
