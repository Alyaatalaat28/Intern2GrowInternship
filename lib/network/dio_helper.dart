import 'package:dio/dio.dart';

class DioHelper{
 static  Dio dio = Dio();
  static Future<void> init() async{
    dio =  Dio(
      BaseOptions(
        receiveDataWhenStatusError: true ,
      ),
    );
  }
   static Future<Response> postData({
     String? token,
    required String url,
    required Map<String,dynamic>data,
     Map<String,dynamic>?query,
   })async{
    dio.options.headers={
       'lang':'en',
       'Content-Type':'application/json',
       'Authorization':token,
    };
    return await dio.post(
      url,
      queryParameters:query ,
      data:data ,
    );
   }
}