import 'dart:convert';

class FactorService {}

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
      'content': content
    };
  }

  @override
  String toString() {
    return 'Id: $factorId, content: $content, feedback: $feedback,' +
    ' questionnaire: $questionnaire';
  }
}