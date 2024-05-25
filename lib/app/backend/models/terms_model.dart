 
class TermsModel {
  int? id;
  String? name;
  String? cover;
  int? studyId;
  int? status;
  String? extraField;

  TermsModel({this.id, this.name, this.cover, this.studyId, this.status, this.extraField});

  TermsModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
    cover = json['cover'];
    studyId = int.parse(json['study_id'].toString());
    status = int.parse(json['status'].toString());
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['study_id'] = studyId;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
