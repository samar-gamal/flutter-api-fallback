import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/specificities_model.dart';
import '../../data/repos/specificities_repo.dart';
import 'specificities_state.dart';


class SpecificitiesCubit extends Cubit<SpecificitiesState> {
  SpecificitiesCubit() : super(SpecificitiesInitial());

  static SpecificitiesCubit get(BuildContext context) => BlocProvider.of(context);

  List<SpecificitiesModel>? specificitiesData;
  Future<bool> getAllItems(SpecificitiesRepo pro) async {
    emit(SpecificitiesLoading());
    final api = await pro.getSpecificities();

    final bool state = api.fold((l) {
      emit(SpecificitiesError());
      return false;
    }, (r) {
      specificitiesData = r;
      emit(SpecificitiesSuccess());
      return true;
    });
    return state;
  }
}
