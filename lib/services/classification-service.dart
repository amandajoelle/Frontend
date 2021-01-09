import 'dart:convert';

import 'package:cirs/services/base-service.dart';
import 'package:cirs/services/token-storage.dart';
import 'package:http/http.dart';

class ClassificationService extends BaseService {
  /// Additional route to the classifications, which doesn't need a token
  final String classificationPath = '/classification/';
  /// Additional route to the classifications, which needs a token
  final String safeClassificationPath = '/cirs_classification/';

  ClassificationService(String url): super(url);

  /// Fetches a [Classification] by its id [classificationId].
  Future<Classification> getClassification(String classificationId) async {
    Classification classification;
    try {
      Response response = await get(
          rootUrl + classificationPath + classificationId,
          headers: {'Accept':'application/json'});
      Map data = jsonDecode(response.body);
      classification = Classification.fromJson(data);
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return classification;
  }

  /// Creates a new [Classification], which is linked with the [medicalCaseId].
  ///
  /// Returns [bool] true, if the classification is successfully persisted.
  Future<bool> postClassification(Classification classification, String medicalCaseId) async {
    String token = TokenStorage().getToken();
    try {
      Response response = await post(
          rootUrl + safeClassificationPath,
          headers: {
            'Accept':'application/json',
            'Content-Type':'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(<String, dynamic>{...classification.toJson(),
            'caseId': medicalCaseId}));
      print(response.statusCode);
    } catch(error) {
      print('Caught error: $error');
      return false;
    }
    return true;
  }

  /// Updates a [Classification] with an altered [classification] object, and specifies
  /// his id [classificationId].
  ///
  /// Returns a [List] with the number of altered objects.
  Future<List<int>> updateClassification(String classificationId, Classification classification) async {
    String token = TokenStorage().getToken();
    List<int> updateResponse;
    try {
      Response response = await put(
          rootUrl + safeClassificationPath + classificationId,
          headers: {
            'Accept':'application/json',
            'Content-Type':'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(classification));
      print(response.statusCode);
      updateResponse = jsonDecode(response.body).cast<int>();
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return updateResponse;
  }
}

class Classification {
  String classId;
  String category;

  Classification({this.classId, this.category});

  /// A factory method to convert a receiving Map, from the backend.,
  /// to a [Classification] object.
  factory Classification.fromJson(Map<String, dynamic> json) {
    return Classification(
      classId: json['class_id'],
      category: json['category']
    );
  }

  /// Converts the current [Classification] object into a Json object.
  Map<String, dynamic> toJson() {
    return {
      'category': category
    };
  }

  @override
  String toString() {
    return 'Id: $classId, category: $category';
  }
}