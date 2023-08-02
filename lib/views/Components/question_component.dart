import 'package:flutter/material.dart';
import 'package:quizz_gpt_app/Models/q&a_model.dart';

class QuestionComponent extends StatelessWidget {
  final QuestionAnswer questionAnswer;

  const QuestionComponent({Key? key, required this.questionAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[300], borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Text(
        questionAnswer.question ?? "",
        textAlign: TextAlign.justify,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
