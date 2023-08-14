class Question {
  int? id;
  int? subjectId;
  String? question;
  String? answer;
  Null? createdAt;
  Null? updatedAt;

  Question(
      {this.id,
      this.subjectId,
      this.question,
      this.answer,
      this.createdAt,
      this.updatedAt});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    question = json['question'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject_id'] = this.subjectId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
