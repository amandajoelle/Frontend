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
}