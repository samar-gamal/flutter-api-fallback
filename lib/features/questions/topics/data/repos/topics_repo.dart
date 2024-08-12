import 'package:dartz/dartz.dart';


import '../../../../../core/errors/failure.dart';
import '../models/topics_model.dart';




abstract class TopicsRepo{
  Future<Either<Failure,List<TopicsModel>>> getTopics();
}