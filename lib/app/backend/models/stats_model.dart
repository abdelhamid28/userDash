 
import 'dart:convert';

import 'package:user/app/backend/models/my_answer_model.dart';

class StatsModel {
  int? id;
  int? examId;
  int? uid;
  double? gained;
  double? total;
  int? result;
  List<MyAnswerModel>? userAnswer;
  List<MyAnswerModel>? realAnwer;
  int? status;
  String? extraField;

  StatsModel({this.id, this.examId, this.uid, this.gained, this.total, this.result, this.userAnswer, this.realAnwer, this.status, this.extraField});

  StatsModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    examId = int.parse(json['exam_id'].toString());
    uid = int.parse(json['uid'].toString());
    gained = double.parse(json['gained'].toString());
    total = double.parse(json['total'].toString());
    result = int.parse(json['result'].toString());
    if (json['user_answer'] != null && json['user_answer'] != '') {
      userAnswer = [];
      var listItems = jsonDecode(json['user_answer']);
      if (listItems.isNotEmpty) {
        listItems.forEach((data) {
          MyAnswerModel dataInfo = MyAnswerModel.fromJson(data);
          userAnswer?.add(dataInfo);
        });
      }
    } else {
      userAnswer = [];
    }

    if (json['real_anwer'] != null && json['real_anwer'] != '') {
      realAnwer = [];
      var listItems = jsonDecode(json['real_anwer']);
      if (listItems.isNotEmpty) {
        listItems.forEach((data) {
          MyAnswerModel dataInfo = MyAnswerModel.fromJson(data);
          realAnwer?.add(dataInfo);
        });
      }
    } else {
      realAnwer = [];
    }
    status = int.parse(json['status'].toString());
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exam_id'] = examId;
    data['uid'] = uid;
    data['gained'] = gained;
    data['total'] = total;
    data['result'] = result;
    data['user_answer'] = userAnswer;
    data['real_anwer'] = realAnwer;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
