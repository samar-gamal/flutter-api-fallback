import 'package:dartz/dartz.dart';


import '../../../../../core/errors/failure.dart';
import '../models/languages_model.dart';


abstract class LanguagesRepo{
  Future<Either<Failure,List<LanguagesModel>>> getLanguages();
}