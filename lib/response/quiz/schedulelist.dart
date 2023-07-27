class ScheduleList {
  String? typeId;
  int? childTypeId;
  String? name;
  int? noQuiz;
  int? status;

  ScheduleList(
      {this.typeId, this.childTypeId, this.name, this.noQuiz, this.status});

  ScheduleList.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    childTypeId = json['child_type_id'];
    name = json['name'];
    noQuiz = json['no_quiz'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_id'] = this.typeId;
    data['child_type_id'] = this.childTypeId;
    data['name'] = this.name;
    data['no_quiz'] = this.noQuiz;
    data['status'] = this.status;
    return data;
  }
}
