import 'package:flutter/material.dart';
import 'package:quizz_gpt_app/models/question_answer_model.dart';

import 'fixed_spacer.dart';

class AnswerComponent extends StatefulWidget {
  final QuestionAnswer answers;
  final int id;
  final bool isSelected;
  final ValueChanged<bool>? onChanged;

  const AnswerComponent({
    super.key,
    required this.id,
    required this.answers,
    required this.isSelected,
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AnswerComponentState createState() => _AnswerComponentState();
}

class _AnswerComponentState extends State<AnswerComponent> {
  bool _isSelected = false;
  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.answers.answer!.length; i++)
          SizedBox(
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
                    widget.answers.answer![i],
                    style: TextStyle(
                      color: _isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        FixedSpacer.vSmallest,
      ],
    );
  }
}
