import 'package:flutter_avision/common/constant.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<http.Response> createUser(Map<String, dynamic> map) {
    return http.post(
      Uri.parse('${Constant.baseurl}${'student_login'}'),
      body: map,
    );
  }

  Future<http.Response> homeapione(Map<String, dynamic> map) {
    return http.post(
      Uri.parse('${Constant.baseurl}${'home_api_one'}'),
      body: map,
    );
  }

  Future<http.Response> homeapitwo(Map<String, dynamic> map) {
    return http.post(
      Uri.parse('${Constant.baseurl}${'home_api_two'}'),
      body: map,
    );
  }

  Future<http.Response> quiztopic(Map<String, dynamic> map) {
    return http.post(
      Uri.parse('${Constant.baseurl}${'quiz_topic'}'),
      body: map,
    );
  }

  Future<http.Response> topicwisequizdetails(Map<String, dynamic> map) {
    return http.post(
      Uri.parse('${Constant.baseurl}${'topic_wise_quiz_details'}'),
      body: map,
    );
  }
}
