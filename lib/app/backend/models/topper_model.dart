 
class TopperModel {
  int? id;
  int? examId;
  int? uid;
  double? gained;
  double? total;
  int? result;
  int? status;
  User? user;

  TopperModel({this.id, this.examId, this.uid, this.gained, this.total, this.result, this.status, this.user});

  TopperModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    examId = int.parse(json['exam_id'].toString());
    uid = int.parse(json['uid'].toString());
    gained = double.parse(json['gained'].toString());
    total = double.parse(json['total'].toString());
    result = int.parse(json['result'].toString());
    status = int.parse(json['status'].toString());
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exam_id'] = examId;
    data['uid'] = uid;
    data['gained'] = gained;
    data['total'] = total;
    data['result'] = result;
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? enroll;
  String? email;
  String? firstName;
  String? lastName;

  User({this.enroll, this.email, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    enroll = json['enroll'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enroll'] = enroll;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
