class DoctorModel{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? type;
  String? gander;
  String? image;
  String? imageID;
  String? bio;
  String? cover;
  bool? isDoctorVerified;

  DoctorModel({
    this.id,
    this.name,
    this.email,
    this.type,
    this.phone,
    this.gander,
    this.uId,
    this.image,
    this.imageID,
    this.bio,
    this.cover,
    this.isDoctorVerified,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone_number'];
    uId = json['uId'];
    type = json['type_name'];
    image = json['image'];
    imageID = json['imageID'];
    gander = json['gander'];
    bio = json['bio'];
    cover = json['cover'];
    isDoctorVerified = json['isDoctorVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phone,
      'type_name': type,
      'uId': uId,
      'gander': gander,
      'image': image,
      'imageID': imageID,
      'bio': bio,
      'cover': cover,
      'isDoctorVerified': isDoctorVerified,
    };
  }
}