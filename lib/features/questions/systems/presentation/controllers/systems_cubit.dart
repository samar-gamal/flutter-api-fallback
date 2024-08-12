import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/systems_model.dart';
import '../../data/repos/systems_repo.dart';
import 'systems_state.dart';



class SystemsCubit extends Cubit<SystemsState> {
  SystemsCubit() : super(SystemsInitial());

  static SystemsCubit get(BuildContext context) => BlocProvider.of(context);

  List<SystemsModel>? systemsData;
  Future<bool> getAllItems(SystemsRepo pro) async {
    emit(SystemsLoading());
    final api = await pro.getSystems();

    final bool state = api.fold((l) {
      emit(SystemsError());
      return false;
    }, (r) {
      systemsData = r;
      emit(SystemsSuccess());
      return true;
    });
    return state;
  }
}
