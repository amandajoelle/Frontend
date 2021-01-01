import 'dart:convert';

import 'package:cirs/services/base-service.dart';
import 'package:cirs/services/token-storage.dart';
import 'package:http/http.dart';

class ClassificationService extends BaseService {
  final String classificationPath = '/classification/';
  final String safeClassificationPath = '/cirs_classification/';

  ClassificationService(String url): super(rootUrl: url);

  Future<Classification> getClassification(String classificationId) async {
    Classification classification;
    try {
      Response response = await get(
          getRootUrl() + classificationPath + classificationId,
          headers: {'Accept':'application/json'});
      Map data = jsonDecode(response.body);
      classification = Classification.fromJson(data);
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return classification;
  }

  Future<bool> postClassification(Classification classification, String medicalCaseId) async {
    String token = TokenStorage().getToken();
    try {
      Response response = await post(
          getRootUrl() + safeClassificationPath,
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

  Future<List<int>> updateClassification(String classificationId, Classification classification) async {
    String token = TokenStorage().getToken();
    List<int> updateResponse;
    try {
      Response response = await put(
          getRootUrl() + safeClassificationPath + classificationId,
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

  factory Classification.fromJson(Map<String, dynamic> json) {
    return Classification(
      classId: json['class_id'],
      category: json['category']
    );
  }

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