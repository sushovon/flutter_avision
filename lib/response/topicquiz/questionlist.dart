class QuestionList {
  String? courseName;
  String? quizId;
  String? quizName;
  String? totQus;
  String? totTime;

  QuestionList(
      {this.courseName, this.quizId, this.quizName, this.totQus, this.totTime});

  QuestionList.fromJson(Map<String, dynamic> json) {
    courseName = json['course_name'];
    quizId = json['quiz_id'];
    quizName = json['quiz_name'];
    totQus = json['tot_qus'];
    totTime = json['tot_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_name'] = courseName;
    data['quiz_id'] = quizId;
    data['quiz_name'] = quizName;
    data['tot_qus'] = totQus;
    data['tot_time'] = totTime;
    return data;
  }
}
