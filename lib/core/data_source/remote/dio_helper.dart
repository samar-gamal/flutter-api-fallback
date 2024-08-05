import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:task1intern/core/data_source/local/cache_manager.dart';

class DioHelper{

 static late Dio _dio;
 static Future<void> init()async{
   _dio=Dio(BaseOptions(
     baseUrl: 'https://fakestoreapi.com/products/',
     receiveTimeout: Duration(seconds: 20),
     connectTimeout: Duration(seconds: 10),
     sendTimeout: Duration(seconds: 20),
     receiveDataWhenStatusError: true,
     validateStatus: (status)=>status!<599,

   ));
 }
 static Future<Response> get({required String endPoint,Map<String,dynamic>?query,
 Options? options})async {
   _dio.options.headers={
     'Accept':'application/json',
     'Authorization':'Bearer ${CacheManager.getDate(key: 'token')}',
   };
   return _dio.get(endPoint,queryParameters: query,options: options);
 }

}