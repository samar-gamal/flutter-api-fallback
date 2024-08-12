import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/languages_model.dart';
import '../../data/repos/languages_repo.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  static LanguageCubit get(BuildContext context) => BlocProvider.of(context);

  List<LanguagesModel>? LanguageData;
  Future<bool> getAllItems(LanguagesRepo pro) async {
    emit(LanguageLoading());
    final api = await pro.getLanguages();

    final bool state = api.fold((l) {
      emit(LanguageError());
      return false;
    }, (r) {
      LanguageData = r;
      emit(LanguageSuccess());
      return true;
    });
    return state;
  }
}
