import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data_source/end_points.dart';
import '../../../../../core/data_source/remote/dio_helper.dart';
import '../../../../../core/errors/failure.dart';
import '../models/systems_model.dart';
import 'systems_repo.dart';




class SystemsRepoImple implements SystemsRepo {
  @override
  Future<Either<Failure, List<SystemsModel>>> getSystems() async {
    try {
      Response response = await DioHelper.get(endPoint: SYST_URL);
      if (response.statusCode == 200) {
        return right(SystemsModel.formListOfJson(response.data));
      } else {
        return left(ServerFailure.fromResponse(response.data));
      }
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }
}
