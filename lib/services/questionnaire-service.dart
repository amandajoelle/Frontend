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
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return questionnaire;
  }

  Future<bool> postQuestionnaire(Questionnaire questionnaire) async {
    try {
      Response response = await post(
          getRootUrl() + questionnairePath,
          headers: {'Accept':'application/json', 'Content-Type':'application/json'},
          body: jsonEncode(questionnaire));
      print(response.statusCode);
    } catch(error) {
      print('Caught error: $error');
      return false;
    }
    return true;
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
      factors: Factor.convertDynamicToFactor(json['Factors'])
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'expertise': expertise,
      'ageGroup': ageGroup,
      'sex': sex,
      'location': location,
      'event': event,
      'result': result,
      'reasons': reasons,
      'frequency': frequency,
      'reporter': reporter,
      'factors': factors
    };
  }

  @override
  String toString() {
    String questionnaireString = 'Id: $questionnaireId, expertise: $expertise, ageGroup: $ageGroup,' +
        ' sex: $sex, location: $location, event: $event, result: $result, reasons: $reasons,' +
        ' frequency: $frequency, reporter: $reporter, Factors: ';

    for (final elem in factors) {
      questionnaireString += elem.toString();
    }
    return questionnaireString;
  }
}