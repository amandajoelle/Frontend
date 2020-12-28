import 'dart:convert';

import 'package:cirs/services/base-service.dart';
import 'package:cirs/services/factor-service.dart';
import 'package:http/http.dart';

class QuestionnaireService extends BaseService {
  final String questionnairePath = '/questionnaire/';

  QuestionnaireService(String url): super(rootUrl: url);

  Future<Questionnaire> getQuestionnaire(String questionnaireId) async {
    Questionnaire questionnaire;
    try {
      Response response = await get(
          getRootUrl() + questionnairePath + questionnaireId,
          headers: {'Accept':'application/json'});
      Map data = jsonDecode(response.body);
      questionnaire = Questionnaire.fromJson(data);
      print('Questionnaire fetched: $questionnaire');
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return questionnaire;
  }
}

class Questionnaire {
  String questionnaireId;
  String expertise;
  String ageGroup;
  String sex;
  String location;
  String event;
  String result;
  String reasons;
  String frequency;
  String reporter;
  List<Factor> factors;

  Questionnaire({this.questionnaireId, this.expertise, this.ageGroup, this.sex,
    this.location, this.event, this.result, this.reasons, this.frequency,
    this.reporter, this.factors});

  factory Questionnaire.fromJson(Map<String, dynamic> json) {
    List<dynamic> dList = json['Factors'];
    return Questionnaire(
      questionnaireId: json['question_id'],
      expertise: json['expertise'],
      ageGroup: json['age_group'],
      sex: json['sex'],
      location: json['location'],
      event: json['event'],
      result: json['result'],
      reasons: json['reasons'],
      frequency: json['frequency'],
      reporter: json['reporter'],
      factors: json['Factors']
    );
  }
}