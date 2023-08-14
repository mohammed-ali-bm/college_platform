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
