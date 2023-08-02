class QuestionAnswer {
  int? id;
  String? question;
  int? correctAnswer;
  List<String>? answer;

  QuestionAnswer({
    required this.id,
    this.question,
    this.correctAnswer,
    this.answer,
  });

  @override
  String toString() {
    return 'QuestionAnswer(id: $id, question: $question, correctAnswer: $correctAnswer, answer: $answer)';
  }
}
