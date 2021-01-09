import 'dart:convert';

import 'package:cirs/services/base-service.dart';
import 'package:cirs/services/factor-service.dart';
import 'package:cirs/services/token-storage.dart';
import 'package:http/http.dart';

class FeedbackService extends BaseService {
  /// Additional route to the feedback's, which doesn't need a token
  final String feedbackPath = '/feedback/';
  /// Additional route to the feedback's, which needs a token
  final String safeFeedbackPath = '/cirs_feedback/';

  FeedbackService(String url): super(url);

  /// Fetches a [Feedback] by its id [feedbackId].
  Future<Feedback> getFeedback(String feedbackId) async {
    Feedback feedback;
    try {
      Response response = await get(
          rootUrl + feedbackPath + feedbackId,
          headers: {'Accept':'application/json'});
      Map data = jsonDecode(response.body);
      feedback = Feedback.fromJson(data);
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return feedback;
  }

  /// Creates a new [Feedback], which is linked with the [medicalCaseId].
  ///
  /// Returns [bool] true, if the classification is successfully persisted.
  Future<bool> postFeedback(Feedback feedback, String medicalCaseId) async {
    String token = TokenStorage().getToken();
    try {
      Response response = await post(
          rootUrl + safeFeedbackPath,
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

  /// Updates a [Feedback] with an altered [feedback] object, and specifies
  /// his id [feedbackId].
  ///
  /// Returns a [List] with the number of altered objects.
  Future<List<int>> updateFeedback(String feedbackId, Feedback feedback) async {
    String token = TokenStorage().getToken();
    List<int> updateResponse;
    try {
      Response response = await put(
          rootUrl + safeFeedbackPath + feedbackId,
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

  /// A factory method to convert a receiving Map, from the backend.,
  /// to a [Feedback] object.
  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      feedbackId: json['feedback_id'],
      comment: json['comment'],
      solution: json['solution'],
      factors: Factor.convertDynamicToFactor(json['Factors'])
    );
  }

  /// Converts the current [Feedback] object into a Json object.
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