import 'dart:convert';

import 'package:cirs/services/base-service.dart';
import 'package:cirs/services/factor-service.dart';
import 'package:cirs/services/token-storage.dart';
import 'package:http/http.dart';

class FeedbackService extends BaseService {
  final String feedbackPath = '/feedback/';
  final String safeFeedbackPath = '/cirs_feedback/';

  FeedbackService(String url): super(rootUrl: url);

  Future<Feedback> getFeedback(String feedbackId) async {
    Feedback feedback;
    try {
      Response response = await get(
          getRootUrl() + feedbackPath + feedbackId,
          headers: {'Accept':'application/json'});
      Map data = jsonDecode(response.body);
      feedback = Feedback.fromJson(data);
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return feedback;
  }

  Future<bool> postFeedback(Feedback feedback, String medicalCaseId) async {
    String token = TokenStorage().getToken();
    try {
      Response response = await post(
          getRootUrl() + safeFeedbackPath,
          headers: {
            'Accept':'application/json',
            'Content-Type':'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(<String, dynamic>{...feedback.toJson(), 'caseId': medicalCaseId}));
      print(response.statusCode);
    } catch(error) {
      print('Caught error: $error');
      return false;
    }
    return true;
  }

  Future<List<int>> updateFeedback(Feedback feedback, String feedbackId) async {
    String token = TokenStorage().getToken();
    List<int> updateResponse;
    try {
      Response response = await put(
          getRootUrl() + safeFeedbackPath + feedbackId,
          headers: {
            'Accept':'application/json',
            'Content-Type':'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(feedback));
      print(response.statusCode);
      updateResponse = jsonDecode(response.body).cast<int>();
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return updateResponse;
  }
}

class Feedback {
  String feedbackId;
  String comment;
  String solution;
  List<Factor> factors;

  Feedback({this.feedbackId, this.comment, this.solution, this.factors});

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      feedbackId: json['feedback_id'],
      comment: json['comment'],
      solution: json['solution'],
      factors: Factor.convertDynamicToFactor(json['Factors'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'solution': solution,
      'factors': factors
    };
  }

  @override
  String toString() {
    return 'Id: $feedbackId, comment: $comment, solution: $solution';
  }
}