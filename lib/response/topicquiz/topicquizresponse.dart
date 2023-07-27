import 'package:flutter_avision/response/topicquiz/questionlist.dart';

class TopicQuizResponse {
  String? statusCode;
  String? message;
  List<QuestionList>? questionList;
  int? studentStatus;

  TopicQuizResponse(
      {this.statusCode, this.message, this.questionList, this.studentStatus});

  TopicQuizResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['question_list'] != null) {
      questionList = <QuestionList>[];
      json['question_list'].forEach((v) {
        questionList!.add(new QuestionList.fromJson(v));
      });
    }
    studentStatus = json['student_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    if (questionList != null) {
      data['question_list'] = questionList!.map((v) => v.toJson()).toList();
    }
    data['student_status'] = studentStatus;
    return data;
  }
}
