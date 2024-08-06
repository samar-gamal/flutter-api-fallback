import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromResponse(Map errors) {
    if (errors.keys.isNotEmpty) {
      return ServerFailure(errors[errors.keys.first][0]);
    } else {
      return ServerFailure('failure.unexpected_error'.tr());
    }
  }

  factory ServerFailure.fromStatusCode(int? code) {
    switch (code) {
      case 400:
        return ServerFailure('failure.code.400'.tr());
      case 401:
        return ServerFailure('failure.code.401'.tr());
      case 403:
        return ServerFailure('failure.code.403'.tr());
      case 404:
        return ServerFailure('failure.code.404'.tr());
      case 500:
        return ServerFailure('failure.code.500'.tr());
      default:
        return ServerFailure('failure.code.default'.tr());
    }
  }

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return ServerFailure('failure.dio.connection_error'.tr());
      case DioExceptionType.connectionTimeout:
        return ServerFailure('failure.dio.connection_timeout'.tr());
      case DioExceptionType.sendTimeout:
        return ServerFailure('failure.dio.send_timeout'.tr());
      case DioExceptionType.receiveTimeout:
        return ServerFailure('failure.dio.receive_timeout'.tr());
      case DioExceptionType.cancel:
        return ServerFailure('failure.dio.request_canceled'.tr());
      case DioExceptionType.unknown:
        return ServerFailure('failure.dio.unexpected_error'.tr());
      default:
        return ServerFailure('failure.dio.ops_error'.tr());
    }
  }

  factory ServerFailure.fromCatchError(dynamic e) {
    if (e is SocketException) {
      return ServerFailure('failure.no_internet'.tr());
    } else if (e is DioException) {
      return ServerFailure.fromDioError(e);
    } else {
      return ServerFailure('failure.unexpected_error'.tr());
    }
  }
}