import 'package:flutter/material.dart';
import 'package:quizz_gpt_app/widgets/answer_component.dart';
import 'package:quizz_gpt_app/widgets/fixed_spacer.dart';
import 'package:quizz_gpt_app/widgets/question_component.dart';
import 'package:quizz_gpt_app/widgets/wave_shape.dart';

import '../models/question_answer_model.dart';

class QuizzView extends StatefulWidget {
  const QuizzView({super.key});

  @override
  State<QuizzView> createState() => _QuizzViewState();
}

class _QuizzViewState extends State<QuizzView> {
  final bool _isSelected = false;
  QuestionAnswer questionAnswer = QuestionAnswer(
    id: 1,
    question:
        "Qual é o nome do primeiro membro da tripulação dos Piratas do Chapéu de Palha a se juntar a Monkey D. Luffy?",
    correctOption: 2,
    answer: ['Roronoa Zoro', 'Nami', 'Usopp', 'Sanji'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: CustomPaint(
        painter: SecondWave(),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image.asset(
                  "assets/images/background.png",
                  height: 250,
                  width: double.infinity,
                ),
              ),
              FixedSpacer.vSmallest,
              Container(
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "QUESTÃO ${questionAnswer.id}/10",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FixedSpacer.vNormal,
              QuestionComponent(questionAnswer: questionAnswer),
              FixedSpacer.vNormal,
              AnswerComponent(
                  id: 1, answers: questionAnswer, isSelected: _isSelected),
              FixedSpacer.vBiggest,
              FixedSpacer.vSmallest,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Próxima'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.forward,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                      label: const Text("Sair"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
