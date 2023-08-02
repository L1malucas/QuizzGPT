import 'package:flutter/material.dart';
import 'package:quizz_gpt_app/views/Pages/home_page.dart';
import 'package:quizz_gpt_app/views/widgets/alert.dart';
import 'package:quizz_gpt_app/views/widgets/fixed_spacer.dart';
import 'package:quizz_gpt_app/views/widgets/wave_shape.dart';

import '../../Models/q&a_model.dart';
import '../Components/answer_component.dart';
import '../Components/question_component.dart';

class QuizzView extends StatefulWidget {
  const QuizzView({super.key});

  @override
  State<QuizzView> createState() => _QuizzViewState();
}

class _QuizzViewState extends State<QuizzView> {
  final bool _isSelected = false;
  int currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
  
    // QuestionAnswer currentQuestion = questionList[currentQuestionIndex];
    return WillPopScope(
      child: Scaffold(
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
                // Container(
                //   width: 140,
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //     borderRadius: BorderRadius.circular(8.0),
                //   ),
                //   child: Text(
                //     "QUESTÃO ${currentQuestion.id}/${questionList.length}",
                //     textAlign: TextAlign.center,
                //     style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 120,
                  child: Align(
                    alignment: Alignment.center,
                    child: QuestionComponent(questionAnswer: currentQuestionIndex),
                  ),
                ),
                AnswerComponent(
                  id: currentQuestionIndex.id!,
                  answers: currentQuestionIndex,
                  isSelected: _isSelected,
                ),
                FixedSpacer.vBiggest,
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.blue[800]!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (currentQuestion.id! == 10) {
                    Alert(
                      onConfirmPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()),
                        );
                      },
                      context: context,
                      message: "Você terminou o quizz.",
                      type: AlertType.success,
                    ).show();
                  } else {
                    showNextQuestion();
                  }
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
        ),
      ),
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Para voltar clique em \'Sair\''),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      },
    );
  }

  void showNextQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }
}
