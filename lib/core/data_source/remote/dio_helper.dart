import 'package:dio/dio.dart';

import '../end_points.dart';
import '../local/cache_manager.dart';


class DioHelper{


 static late Dio _dio;
 static Future<void> init()async{
   _dio=Dio(BaseOptions(
     baseUrl: BASE_URL,
     receiveTimeout: const Duration(seconds: 20),
     connectTimeout: const Duration(seconds: 10),
     sendTimeout: const Duration(seconds: 20),
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
 /// Dio Post Request
 static Future<Response> post({
   required String endpoint,
   Map<String, dynamic>? query,
   Options? options,
   required Map<String, dynamic> data,
   bool isFormData = true,
 }) async {
   _dio.options.headers = {
     'Accept': 'application/json',
     'Authorization': 'Bearer ${CacheManager.getDate(key: 'token')}'
   };
   return _dio.post(
     endpoint,
     data: isFormData ? FormData.fromMap(data) : data,
     queryParameters: query,
     options: options,
   );
 }

 /// Dio Put Request
 static Future<Response> put({
   required String endpoint,
   Map<String, dynamic>? query,
   Options? options,
   required Map<String, dynamic> data,
   bool isFormData = true,
 }) async {
   _dio.options.headers = {
     'Accept': 'application/json',
     'Authorization': 'Bearer ${CacheManager.getDate(key: 'token')}'
   };
   return _dio.put(
     endpoint,
     data: isFormData ? FormData.fromMap(data) : data,
     queryParameters: query,
     options: options,
   );
 }

 /// Dio Delete Request
 static Future<Response> delete({
   required String endpoint,
   Map<String, dynamic>? query,
   Options? options,
   bool isFormData = true,
 }) async {
   _dio.options.headers = {
     'Accept': 'application/json',
     'Authorization': 'Bearer ${CacheManager.getDate(key: 'token')}'
   };
   return _dio.delete(endpoint, queryParameters: query, options: options);
 }

}