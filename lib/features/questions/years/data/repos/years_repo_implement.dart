import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data_source/end_points.dart';
import '../../../../../core/data_source/remote/dio_helper.dart';
import '../../../../../core/errors/failure.dart';
import '../models/years_model.dart';
import 'years_repo.dart';




class YearsRepoImple implements YearsRepo {
  @override
  Future<Either<Failure, List<YearsModel>>> getYears() async {
    try {
      Response response = await DioHelper.get(endPoint: YEAR_URL);
      if (response.statusCode == 200) {
        return right(YearsModel.formListOfJson(response.data));
      } else {
        return left(ServerFailure.fromResponse(response.data));
      }
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }
}
