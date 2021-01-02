import 'dart:convert';

import 'package:cirs/services/base-service.dart';
import 'package:cirs/services/token-storage.dart';
import 'package:cirs/services/employee-service.dart';
import 'package:http/http.dart';

class MedicalCaseService extends BaseService {
  final String medicalCasePath = '/case/';
  final String safeMedicalCasePath = '/medical_case/';

  MedicalCaseService(String url): super(rootUrl: url);

  Future<MedicalCase> getMedicalCase(String medicalCaseId) async {
    MedicalCase medicalCase;
    try {
      Response response = await get(
          getRootUrl() + medicalCasePath + medicalCaseId,
          headers: {'Accept':'application/json'});
      Map data = jsonDecode(response.body);
      medicalCase = MedicalCase.fromJson(data);
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return medicalCase;
  }

  Future<List<MedicalCase>> getAllDoneMedicalCases() async {
    List<MedicalCase> medicalCases;
    try {
      Response response = await get(
          getRootUrl() + medicalCasePath + 'done/',
          headers: {'Accept':'application/json'});
      medicalCases = MedicalCase.convertDynamicToMedicalCase(jsonDecode(response.body));
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return medicalCases;
  }

  Future<List<MedicalCase>> getAllIncompleteMedicalCases() async {
    String token = TokenStorage().getToken();
    List<MedicalCase> medicalCases;
    try {
      Response response = await get(
          getRootUrl() + safeMedicalCasePath + 'incomplete/',
          headers: {
            'Accept':'application/json',
            'Authorization':'Bearer $token'
          });
      medicalCases = MedicalCase.convertDynamicToMedicalCase(jsonDecode(response.body));
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return medicalCases;
  }

  Future<List<int>> updateMedicalCase(String medicalCaseId, MedicalCase medicalCase) async {
    String token = TokenStorage().getToken();
    List<int> updateResponse;
    try {
      Response response = await put(
          getRootUrl() + safeMedicalCasePath + medicalCaseId,
          headers: {
            'Accept':'application/json',
            'Content-Type':'application/json',
            'Authorization':'Bearer $token'
          },
          body: jsonEncode(medicalCase));
      print(response.statusCode);
      updateResponse = jsonDecode(response.body).cast<int>();
    } catch(error) {
      print('Caught error: $error');
      return null;
    }
    return updateResponse;
  }
}

class MedicalCase {
  String caseId;
  String title;
  String status;
  String feedback;
  String questionnaire;
  String classification;
  String editor;
  Employee employee;

  MedicalCase({this.caseId, this.title, this.status, this.feedback,
    this.questionnaire, this.classification, this.editor, this.employee});

  factory MedicalCase.fromJson(Map<String, dynamic> json) {
    return MedicalCase(
      caseId: json['case_id'],
      title: json['title'],
      status: json['status'],
      feedback: json['feedback'],
      questionnaire: json['questionnaire'],
      classification: json['classification'],
      editor: json['editor'],
      employee: Employee.fromJson(json['Employee'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'status': status,
      'feedback': feedback,
      'questionnaire': questionnaire,
      'classification': classification,
      'editor': editor
    };
  }

  static List<MedicalCase> convertDynamicToMedicalCase(List<dynamic> response) {
    List<MedicalCase> medicalCases = [];
    for(final elem in response) {
      MedicalCase medicalCase = MedicalCase(caseId: elem['case_id'], title: elem['title'],
          status: elem['status'], feedback: elem['feedback'],
          questionnaire: elem['questionnaire'], classification: elem['classification'],
          editor: elem['editor'], employee: elem['Employee'] != null ?
          Employee.fromJson(elem['Employee']) : null );
      medicalCases.add(medicalCase);
    }
    return medicalCases;
  }

  @override
  String toString() {
    return 'Id: $caseId, title: $title, status: $status, feedback: $feedback, '
        'questionnaire: $questionnaire, classification: $classification, '
        'editor: $editor';
  }
}