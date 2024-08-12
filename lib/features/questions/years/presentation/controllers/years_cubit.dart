import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/years_model.dart';
import '../../data/repos/years_repo.dart';
import 'years_state.dart';


class YearsCubit extends Cubit<YearsState> {
  YearsCubit() : super(YearsInitial());

  static YearsCubit get(BuildContext context) => BlocProvider.of(context);

  List<YearsModel>? yearsData;
  Future<bool> getAllItems(YearsRepo pro) async {
    emit(YearsLoading());
    final api = await pro.getYears();

    final bool state = api.fold((l) {
      emit(YearsError());
      return false;
    }, (r) {
      yearsData = r;
      emit(YearsSuccess());
      return true;
    });
    return state;
  }
}
