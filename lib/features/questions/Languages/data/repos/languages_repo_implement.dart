import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data_source/end_points.dart';
import '../../../../../core/data_source/remote/dio_helper.dart';
import '../../../../../core/errors/failure.dart';
import '../models/languages_model.dart';
import 'languages_repo.dart';


class LanguagesRepoImple implements LanguagesRepo {
  @override
  Future<Either<Failure, List<LanguagesModel>>> getLanguages() async {
    try {
      Response response = await DioHelper.get(endPoint: LANG_URL);
      if (response.statusCode == 200) {
        return right(LanguagesModel.formListOfJson(response.data));
      } else {
        return left(ServerFailure.fromResponse(response.data));
      }
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }
}
