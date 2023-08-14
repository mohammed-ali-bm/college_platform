class Note {
  int? id;
  int? subjectId;
  int? userId;
  String? title;
  String? content;
  String? status;
  String? file;
  String? createdAt;
  String? updatedAt;
  Subject? subject;

  Note(
      {this.id,
      this.subjectId,
      this.userId,
      this.title,
      this.content,
      this.status,
      this.file,
      this.createdAt,
      this.updatedAt,
      this.subject});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    userId = json['user_id'];
    title = json['title'];
    content = json['content'];
    status = json['status'];
    file = json['file'];
    createdAt = json['created_at'].toString().substring(0, 10);
    updatedAt = json['updated_at'];
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject_id'] = this.subjectId;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['status'] = this.status;
    data['file'] = this.file;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}

class Subject {
  int? id;
  int? departmentId;
  int? semesterId;
  String? name;
  Null? createdAt;
  Null? updatedAt;

  Subject(
      {this.id,
      this.departmentId,
      this.semesterId,
      this.name,
      this.createdAt,
      this.updatedAt});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['department_id'];
    semesterId = json['semester_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['department_id'] = this.departmentId;
    data['semester_id'] = this.semesterId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
