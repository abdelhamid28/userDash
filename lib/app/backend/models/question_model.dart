 
import 'dart:convert';

import 'package:user/app/backend/models/question_list_model.dart';

class QuestionModel {
  int? id;
  int? examId;
  List<QuestionListModel>? questionsList;
  int? status;
  String? extraField;

  QuestionModel({this.id, this.examId, this.questionsList, this.status, this.extraField});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    examId = int.parse(json['exam_id'].toString());
    if (json['questionsList'] != null && json['questionsList'] != '') {
      questionsList = [];
      var listItems = jsonDecode(json['questionsList']);
      if (listItems.isNotEmpty) {
        listItems.forEach((data) {
          QuestionListModel dataInfo = QuestionListModel.fromJson(data);
          questionsList?.add(dataInfo);
        });
      }
    } else {
      questionsList = [];
    }
    status = int.parse(json['status'].toString());
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exam_id'] = examId;
    data['questionsList'] = questionsList;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
