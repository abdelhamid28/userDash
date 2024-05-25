 
class UserModel {
  String? email;
  String? firstName;
  String? lastName;
  int? type;
  int? status;
  String? mobile;
  String? cover;
  String? countryCode;
  int? gender;
  String? enroll;
  int? termId;
  int? studyId;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserModel(
      {this.email,
      this.firstName,
      this.lastName,
      this.type,
      this.status,
      this.mobile,
      this.cover,
      this.countryCode,
      this.gender,
      this.enroll,
      this.termId,
      this.studyId,
      this.updatedAt,
      this.createdAt,
      this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    type = int.parse(json['type'].toString());
    status = int.parse(json['status'].toString());
    mobile = json['mobile'];
    cover = json['cover'];
    countryCode = json['country_code'];
    gender = int.parse(json['gender'].toString());
    enroll = json['enroll'];
    termId = int.parse(json['term_id'].toString());
    studyId = int.parse(json['study_id'].toString());
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = int.parse(json['id'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['type'] = type;
    data['status'] = status;
    data['mobile'] = mobile;
    data['cover'] = cover;
    data['country_code'] = countryCode;
    data['gender'] = gender;
    data['enroll'] = enroll;
    data['term_id'] = termId;
    data['study_id'] = studyId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
