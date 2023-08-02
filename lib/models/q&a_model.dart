class QuestionAnswer {
  int? id;
  String? question;
  int? correctOption;
  List<String>? answer;

  QuestionAnswer({
    required this.id,
    this.question,
    this.correctOption,
    this.answer,
  });

  @override
  String toString() {
    return ' QuestionAnswer(id: 1,answer: ["aaaa", "bbbb", "ccccc", "ddddd"],correctOption: 1,question: "ss")';
  }
}
