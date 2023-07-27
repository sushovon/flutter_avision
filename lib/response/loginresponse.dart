import 'package:json_annotation/json_annotation.dart';
part 'loginresponse.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class LoginResponse {
  String? statusCode;
  String? message;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userId;
  String? userImg;
  String? appId;
  String? userRole;
  String? studentArea;

  LoginResponse(
      {this.statusCode,
      this.message,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userId,
      this.userImg,
      this.appId,
      this.userRole,
      this.studentArea});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  /* LoginResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userId = json['user_id'];
    userImg = json['user_img'];
    appId = json['app_id'];
    userRole = json['user_role'];
    studentArea = json['student_area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = statusCode;
    data['message'] = message;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_phone'] = userPhone;
    data['user_id'] = userId;
    data['user_img'] = userImg;
    data['app_id'] = appId;
    data['user_role'] = userRole;
    data['student_area'] = studentArea;
    return data;
  } */
}
