 
class MyAnswerModel {
  int? id;
  String? answer;

  MyAnswerModel({this.id, this.answer});

  MyAnswerModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    return data;
  }
}
