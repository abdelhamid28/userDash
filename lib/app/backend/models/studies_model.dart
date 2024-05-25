 
class StudiesModel {
  int? id;
  String? name;
  String? cover;
  int? status;
  String? extraField;

  StudiesModel({this.id, this.name, this.cover, this.status, this.extraField});

  StudiesModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
    cover = json['cover'];
    status = int.parse(json['status'].toString());
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
