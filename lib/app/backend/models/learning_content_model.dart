 
class LearningContentModel {
  int? id;
  String? qustion;
  bool? haveImage;
  String? imageURL;
  String? answer;

  LearningContentModel({this.id, this.qustion, this.haveImage, this.imageURL, this.answer});

  LearningContentModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    qustion = json['qustion'];
    haveImage = json['haveImage'];
    imageURL = json['imageURL'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['qustion'] = qustion;
    data['haveImage'] = haveImage;
    data['imageURL'] = imageURL;
    data['answer'] = answer;
    return data;
  }
}
