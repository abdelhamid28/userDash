 
class SubjectsModel {
  int? id;
  String? name;
  String? cover;
  int? studyId;
  int? termId;
  int? status;
  String? extraField;

  SubjectsModel({this.id, this.name, this.cover, this.studyId, this.termId, this.status, this.extraField});

  SubjectsModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
    cover = json['cover'];
    studyId = int.parse(json['study_id'].toString());
    termId = int.tryParse(json['term_id'].toString());
    status = int.parse(json['status'].toString());
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['study_id'] = studyId;
    data['term_id'] = termId;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
