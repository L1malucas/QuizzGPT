import 'package:flutter/material.dart';
import 'package:quizz_gpt_app/views/home_view.dart';
import 'package:quizz_gpt_app/widgets/alert.dart';
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
  final List<QuestionAnswer> questionList = [
    QuestionAnswer(
      id: 1,
      question:
          "Qual é o nome do arqueólogo que acompanha os Piratas do Chapéu de Palha?",
      correctOption: 1,
      answer: [
        "Roronoa Zoro",
        "Nico Robin",
        "Franky",
        "Usopp",
      ],
    ),
    QuestionAnswer(
      id: 2,
      question: "Qual é o nome do espadachim que possui três espadas?",
      correctOption: 2,
      answer: [
        "Monkey D. Luffy",
        "Sanji",
        "Roronoa Zoro",
        "Brook",
      ],
    ),
    QuestionAnswer(
      id: 3,
      question:
          "Qual é a fruta do diabo que permite que o usuário controle o fogo?",
      correctOption: 2,
      answer: [
        "Bara Bara no Mi",
        "Gomu Gomu no Mi",
        "Mera Mera no Mi",
        "Hie Hie no Mi",
      ],
    ),
    QuestionAnswer(
      id: 4,
      question: "Qual é o nome do capitão dos Piratas do Coração?",
      correctOption: 2,
      answer: [
        "Bepo",
        "Killer",
        "Trafalgar Law",
        "Penguin",
      ],
    ),
    QuestionAnswer(
      id: 5,
      question: "Qual é o nome da ilha onde nasceu Monkey D. Luffy?",
      correctOption: 3,
      answer: [
        "Loguetown",
        "Sabaody Archipelago",
        "Water 7",
        "Foosha Village",
      ],
    ),
    QuestionAnswer(
      id: 6,
      question: "Qual é o nome do animal de estimação de Nami?",
      correctOption: 1,
      answer: [
        "Panda",
        "Gaivota",
        "Renas",
        "Gato",
      ],
    ),
    QuestionAnswer(
      id: 7,
      question: "Qual é o nome da espada de Roronoa Zoro?",
      correctOption: 0,
      answer: [
        "Wado Ichimonji",
        "Shusui",
        "Yubashiri",
        "Santoryu",
      ],
    ),
    QuestionAnswer(
      id: 8,
      question: "Qual é o nome do cozinheiro dos Piratas do Chapéu de Palha?",
      correctOption: 1,
      answer: [
        "Nico Robin",
        "Sanji",
        "Franky",
        "Chopper",
      ],
    ),
    QuestionAnswer(
      id: 9,
      question:
          "Qual é o nome da ilha em que o One Piece está supostamente escondido?",
      correctOption: 3,
      answer: [
        "Skypiea",
        "Wano",
        "Alabasta",
        "Laugh Tale",
      ],
    ),
    QuestionAnswer(
      id: 10,
      question:
          "Qual é o nome do primeiro navio dos Piratas do Chapéu de Palha?",
      correctOption: 0,
      answer: [
        "Going Merry",
        "Sunny Go",
        "Thousand Sunny",
        "Victory Hunter",
      ],
    ),
  ];

  int currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    QuestionAnswer currentQuestion = questionList[currentQuestionIndex];
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
                FixedSpacer.vSmallest,
                Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "QUESTÃO ${currentQuestion.id}/${questionList.length}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FixedSpacer.vNormal,
                SizedBox(
                  height: 120,
                  child: Align(
                    alignment: Alignment.center,
                    child: QuestionComponent(questionAnswer: currentQuestion),
                  ),
                ),
                FixedSpacer.vNormal,
                AnswerComponent(
                  id: currentQuestion.id!,
                  answers: currentQuestion,
                  isSelected: _isSelected,
                ),
                FixedSpacer.vBiggest,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if ((questionList.length - 1) == currentQuestionIndex) {
                          print("$currentQuestionIndex ${questionList.length}");
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
                          print("$currentQuestionIndex ${questionList.length}");
                          showNextQuestion();
                        }
                      },
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
      ),
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Para voltar clique em sair'),
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
