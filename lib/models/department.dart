class Department {
  int? id;
  String? name;
  String? description;
  String? price;
  String? createdAt;
  String? registersNeeded;
  String? image;
  String? totalRegisters;
  bool? showNewPrice;
  String? newPrice;

  Department(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.registersNeeded,
      this.image,
      this.totalRegisters,
      this.showNewPrice,
      this.newPrice});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    registersNeeded = json['registers_needed'];
    image = json['image'];
    totalRegisters = json['total_registers'];
    showNewPrice = json['show_new_price'];
    newPrice = json['new_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['registers_needed'] = this.registersNeeded;
    data['image'] = this.image;
    data['total_registers'] = this.totalRegisters;
    data['show_new_price'] = this.showNewPrice;
    data['new_price'] = this.newPrice;
    return data;
  }
}
