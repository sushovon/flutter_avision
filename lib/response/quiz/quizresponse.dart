import 'ScheduleList.dart';

class QuizResponse {
  String? statusCode;
  String? message;
  List<ScheduleList>? scheduleList;
  int? studentStatus;

  QuizResponse(
      {this.statusCode, this.message, this.scheduleList, this.studentStatus});

  QuizResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['schedule_list'] != null) {
      scheduleList = <ScheduleList>[];
      json['schedule_list'].forEach((v) {
        scheduleList!.add(new ScheduleList.fromJson(v));
      });
    }
    studentStatus = json['student_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    if (this.scheduleList != null) {
      data['schedule_list'] = scheduleList!.map((v) => v.toJson()).toList();
    }
    data['student_status'] = studentStatus;
    return data;
  }
}
