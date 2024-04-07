import 'package:dio/dio.dart';
class DioHelper {
 static Dio ?dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,//هات الداتا حتى لو ال status ايرور
    /* headers: {
          'Content-Type': 'application/json',// ال headers الثابتة بحطها هون دايما
       //'lang':'en', لو بدي اياه يرد علي بالانجليزي بستحدم هاي
        }),*/
    ));
  }
  static Future<Response?> getdata({
  required String url,
    dynamic query,
  String lang='en',
    String ?token,
 })async
  {
    dio?.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token

    };




    return await dio?.get(url, queryParameters: query??null );
}
static Future<Response> postData({
  required String url,
   dynamic query,
  required Map<String,dynamic> data,
  String lang='en',
  String ?token,

}
    )async{
  dio?.options.headers={
    'Content-Type':'application/json',
    'lang':lang,
    'Authorization':token??''

  };
    return dio!.post(
        url,
        queryParameters: query,
    data: data
    );
    
}


 static Future<Response> putData({
   required String url,
   dynamic query,
   required Map<String,dynamic> data,
   String lang='en',
   String ?token,

 }
     )async{
   dio?.options.headers={
     'Content-Type':'application/json',
     'lang':lang,
     'Authorization':token??''

   };
   return dio!.put(
       url,
       queryParameters: query,
       data: data
   );

 }


}