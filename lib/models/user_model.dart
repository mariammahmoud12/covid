class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? type;
  String? uId;
  String? image;
  String? gander;
  String? bio;
  String? cover;
  bool? isEmailVerified;

  UserModel({
    this.id,
    this.name,
    this.type,
    this.email,
    this.phone,
    this.gander,
    this.uId,
    this.image,
    this.bio,
    this.cover,
    this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone_number'];
    type = json['type_name'];
    gander = json['gander'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];
    cover = json['cover'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phone,
      'gander': gander,
      'type_name': type,
      'uId': uId,
      'image': image,
      'bio': bio,
      'cover': cover,
      'isEmailVerified': isEmailVerified,
    };
  }
}
