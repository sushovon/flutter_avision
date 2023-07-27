import 'package:dio/dio.dart';
import 'package:flutter_avision/response/loginresponse.dart';
import 'package:retrofit/retrofit.dart';
part 'restclient.g.dart';

@RestApi(baseUrl: "https://app.avision.co.in/index.php/api/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  @POST("/student_login")
  @FormUrlEncoded()
  /* Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  }; */
  Future<LoginResponse> getLogin(@Body() Map<String, dynamic> body);
  /* Future<LoginResponse> getLogin(@Body() Map<String, dynamic> body,
      {@Header('Content-Type') String contentType = 'application/json',
      @Header('Charset') String charset = 'utf-8'}); */
}
