import 'package:flutter/material.dart';

import '../../Services/read_json.dart';
import '../../Models/q&a_model.dart';

class AnswerComponent extends StatefulWidget {
  final int id;
  final bool isSelected;
  final ValueChanged<bool>? onChanged;

  const AnswerComponent({
    super.key,
    required this.id,
    required this.isSelected,
    this.onChanged, required QuestionAnswer answers,
  });

  @override
  _AnswerComponentState createState() => _AnswerComponentState();
}

class _AnswerComponentState extends State<AnswerComponent> {
  bool _isSelected = false;
  String questionText = '';

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
    _loadQuestion();
  }

  // Load question data from the ReadJson class
  void _loadQuestion() async {
    final List<QuestionAnswer> questionAnswers = await ReadJson().readData();
    final QuestionAnswer questionAnswer =
        questionAnswers.firstWhere((qa) => qa.id == widget.id);
    setState(() {
      questionText = questionAnswer.question ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
            widget.onChanged?.call(_isSelected);
          });
        },
        child: Card(
          elevation: _isSelected ? 4.0 : 1.0,
          color: _isSelected ? Colors.blue : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              questionText,
              style: TextStyle(
                color: _isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
