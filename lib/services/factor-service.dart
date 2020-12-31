import 'dart:convert';

import 'package:cirs/services/base-service.dart';
import 'package:http/http.dart';

class FactorService extends BaseService {
  final String factorPath = '/factor/';

  FactorService(String url) : super(rootUrl: url);

  Future<Factor> getFactor(String factorId) async {
    Factor factor;
    try {
      Response response = await get(
          getRootUrl() + factorPath + factorId,
          headers: {'Accept': 'application/json'});
      Map data = jsonDecode(response.body);
      factor = Factor.fromJson(data);
      print('Factor: $factor');
    } catch (error) {
      print('Caught error: $error');
      return null;
    }
    return factor;
  }

  Future<List<Factor>> getAllFactorsOfQuestionnaire(String questionnaireId) async {
    List<Factor> factors;
    try {
      Response response = await get(
          getRootUrl() + factorPath + 'questionnaire/$questionnaireId',
          headers: {'Accept': 'application/json'});
      factors = Factor.convertDynamicToFactor(jsonDecode(response.body));
    } catch (error) {
      print('Caught error: $error');
      return null;
    }
    return factors;
  }

  Future<List<Factor>> getAllFactorsOfFeedback(String feedbackId) async {
    List<Factor> factors;
    try {
      Response response = await get(
          getRootUrl() + factorPath + 'feedback/$feedbackId',
          headers: {'Accept':'application/json'});
      factors = Factor.convertDynamicToFactor(jsonDecode(response.body));
      print('Factors: $factors');
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return factors;
  }

  Future<List<int>> updateFactor(String factorId, Factor factor) async {
    List<int> updateResponse;
    try {
      Response response = await put(
          getRootUrl() + factorPath + factorId,
          headers: {
            'Accept':'application/json',
            'Content-Type':'application/json'
          },
          body: jsonEncode(factor));
      print(response.statusCode);
      updateResponse = jsonDecode(response.body).cast<int>();
      print('Updated: $updateResponse');
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return updateResponse;
  }
}

class Factor {
  String factorId;
  String content;
  String feedback;
  String questionnaire;

  Factor({this.factorId, this.content, this.feedback, this.questionnaire});

  factory Factor.fromJson(Map<String, dynamic> json) {
    return Factor(
      factorId: json['factor_id'],
      content: json['content'],
      feedback: json['feedback'],
      questionnaire: json['questionnaire']
    );
  }

  static List<Factor> convertDynamicToFactor(List<dynamic> response) {
    List<Factor> factors = [];
    for(final elem in response) {
      Factor factor = Factor(factorId: elem['factor_id'], content: elem['content'],
          feedback: elem['feedback'], questionnaire: elem['questionnaire']);
      factors.add(factor);
    }
    return factors;
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'feedback': feedback,
      'questionnaire': questionnaire
    };
  }

  @override
  String toString() {
    return 'Id: $factorId, content: $content, feedback: $feedback,' +
    ' questionnaire: $questionnaire';
  }
}