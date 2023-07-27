// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map json) => LoginResponse(
      statusCode: json['statusCode'] as String?,
      message: json['message'] as String?,
      userName: json['userName'] as String?,
      userEmail: json['userEmail'] as String?,
      userPhone: json['userPhone'] as String?,
      userId: json['userId'] as String?,
      userImg: json['userImg'] as String?,
      appId: json['appId'] as String?,
      userRole: json['userRole'] as String?,
      studentArea: json['studentArea'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'userPhone': instance.userPhone,
      'userId': instance.userId,
      'userImg': instance.userImg,
      'appId': instance.appId,
      'userRole': instance.userRole,
      'studentArea': instance.studentArea,
    };
