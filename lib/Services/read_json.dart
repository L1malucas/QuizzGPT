import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/q&a_model.dart';

class ReadJson {
  Future<List<QuestionAnswer>> readData() async {
    final String response =
        await rootBundle.loadString('./Data/q&a_json_data.json');
    final List<dynamic> jsonData = json.decode(response)['data'];
    final List<QuestionAnswer> questionAnswers = jsonData.map((data) {
      return QuestionAnswer(
        id: data['id'],
        question: data['question'],
        correctAnswer: data['correctAnswer'],
        answer: List<String>.from(data['answer']),
      );
    }).toList();
    return questionAnswers;
  }
}
