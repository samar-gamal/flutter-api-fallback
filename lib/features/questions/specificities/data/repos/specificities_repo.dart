import 'package:dartz/dartz.dart';


import '../../../../../core/errors/failure.dart';
import '../models/specificities_model.dart';



abstract class SpecificitiesRepo{
  Future<Either<Failure,List<SpecificitiesModel>>> getSpecificities();
}