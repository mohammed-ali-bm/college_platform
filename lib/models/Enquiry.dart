class Enquiry {
  int? id;
  int? userId;
  String? title;
  String? content;
  String? status;
  String? createdAt;
  String? updatedAt;

  Enquiry(
      {this.id,
      this.userId,
      this.title,
      this.content,
      this.status,
      this.createdAt,
      this.updatedAt});

  Enquiry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    content = json['content'];
    status = json['status'];
    createdAt = json['created_at'].toString().substring(0, 10);
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
