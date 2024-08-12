import 'package:dartz/dartz.dart';


import '../../../../../core/errors/failure.dart';
import '../models/years_model.dart';





abstract class YearsRepo{
  Future<Either<Failure,List<YearsModel>>> getYears();
}