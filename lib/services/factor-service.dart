import 'dart:convert';

import 'package:cirs/services/base-service.dart';
import 'package:http/http.dart';

class FactorService extends BaseService {
  /// Additional route to the factors, which doesn't need a token
  final String factorPath = '/factor/';

  FactorService(String url) : super(url);

  /// Fetches a [Factor] by its id [factorId].
  Future<Factor> getFactor(String factorId) async {
    Factor factor;
    try {
      Response response = await get(
          rootUrl + factorPath + factorId,
          headers: {'Accept': 'application/json'});
      Map data = jsonDecode(response.body);
      factor = Factor.fromJson(data);
    } catch (error) {
      print('Caught error: $error');
      return null;
    }
    return factor;
  }

  /// Fetches all factors of a questionnaire by the [questionnaireId].
  Future<List<Factor>> getAllFactorsOfQuestionnaire(String questionnaireId) async {
    List<Factor> factors;
    try {
      Response response = await get(
          rootUrl + factorPath + 'questionnaire/$questionnaireId',
          headers: {'Accept': 'application/json'});
      factors = Factor.convertDynamicToFactor(jsonDecode(response.body));
    } catch (error) {
      print('Caught error: $error');
      return null;
    }
    return factors;
  }

  /// Fetches all factors of one feedback by the [feedbackId].
  Future<List<Factor>> getAllFactorsOfFeedback(String feedbackId) async {
    List<Factor> factors;
    try {
      Response response = await get(
          rootUrl + factorPath + 'feedback/$feedbackId',
          headers: {'Accept':'application/json'});
      factors = Factor.convertDynamicToFactor(jsonDecode(response.body));
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return factors;
  }

  /// Updates a [Factor] with an altered [factor] object, and specifies
  /// his id [factorId].
  ///
  /// Returns a [List] with the number of altered objects.
  Future<List<int>> updateFactor(String factorId, Factor factor) async {
    List<int> updateResponse;
    try {
      Response response = await put(
          rootUrl + factorPath + factorId,
          headers: {
            'Accept':'application/json',
            'Content-Type':'application/json'
          },
          body: jsonEncode(factor));
      print(response.statusCode);
      updateResponse = jsonDecode(response.body).cast<int>();
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

  /// A factory method to convert a receiving Map, from the backend.,
  /// to a [Factor] object.
  factory Factor.fromJson(Map<String, dynamic> json) {
    return Factor(
      factorId: json['factor_id'],
      content: json['content'],
      feedback: json['feedback'],
      questionnaire: json['questionnaire']
    );
  }

  /// Coverts the backend factors [response] to a [List] of Factors.
  static List<Factor> convertDynamicToFactor(List<dynamic> response) {
    List<Factor> factors = [];
    for(final elem in response) {
      Factor factor = Factor(factorId: elem['factor_id'], content: elem['content'],
          feedback: elem['feedback'], questionnaire: elem['questionnaire']);
      factors.add(factor);
    }
    return factors;
  }

  /// Converts the current [Factor] object into a Json object.
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