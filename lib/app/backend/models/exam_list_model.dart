 
import 'package:jiffy/jiffy.dart';

class ExamListModel {
  int? id;
  String? name;
  String? cover;
  int? studyId;
  int? termId;
  int? subjectId;
  double? passingMarks;
  double? negativeMarks;
  String? startTime;
  String? endTime;
  String? examinerName;
  String? examinerPhone;
  String? examinerPosition;
  double? totalQuestions;
  int? haveNegative;
  int? status;
  String? extraField;
  bool? attempted;
  Stats? stats;

  ExamListModel(
      {this.id,
      this.name,
      this.cover,
      this.studyId,
      this.termId,
      this.subjectId,
      this.passingMarks,
      this.negativeMarks,
      this.startTime,
      this.endTime,
      this.examinerName,
      this.examinerPhone,
      this.examinerPosition,
      this.totalQuestions,
      this.haveNegative,
      this.status,
      this.extraField,
      this.attempted,
      this.stats});

  ExamListModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
    cover = json['cover'];
    studyId = int.parse(json['study_id'].toString());
    termId = int.parse(json['term_id'].toString());
    subjectId = int.parse(json['subject_id'].toString());
    passingMarks = double.parse(json['passingMarks'].toString());
    negativeMarks = double.parse(json['negativeMarks'].toString());
    startTime = Jiffy(json['startTime']).yMMMd;
    endTime = Jiffy(json['endTime']).yMMMd;
    examinerName = json['examinerName'];
    examinerPhone = json['examinerPhone'];
    examinerPosition = json['examinerPosition'];
    totalQuestions = double.parse(json['totalQuestions'].toString());
    haveNegative = int.parse(json['haveNegative'].toString());
    status = int.parse(json['status'].toString());
    extraField = json['extra_field'];
    attempted = json['attempted'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['study_id'] = studyId;
    data['term_id'] = termId;
    data['subject_id'] = subjectId;
    data['passingMarks'] = passingMarks;
    data['negativeMarks'] = negativeMarks;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['examinerName'] = examinerName;
    data['examinerPhone'] = examinerPhone;
    data['examinerPosition'] = examinerPosition;
    data['totalQuestions'] = totalQuestions;
    data['haveNegative'] = haveNegative;
    data['status'] = status;
    data['extra_field'] = extraField;
    data['attempted'] = attempted;
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    return data;
  }
}

class Stats {
  int? id;
  int? examId;
  int? uid;
  double? gained;
  double? total;
  int? result;
  int? status;

  Stats({this.id, this.examId, this.uid, this.gained, this.total, this.result, this.status});

  Stats.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    examId = int.parse(json['exam_id'].toString());
    uid = int.parse(json['uid'].toString());
    gained = double.parse(json['gained'].toString());
    total = double.parse(json['total'].toString());
    result = int.parse(json['result'].toString());
    status = int.parse(json['status'].toString());
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
    return data;
  }
}
