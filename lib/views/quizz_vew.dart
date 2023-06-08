import 'package:flutter/material.dart';
import 'package:quizz_gpt_app/widgets/answer_component.dart';
import 'package:quizz_gpt_app/widgets/fixed_spacer.dart';
import 'package:quizz_gpt_app/widgets/wave_shape.dart';

class QuizzView extends StatefulWidget {
  const QuizzView({super.key});

  @override
  State<QuizzView> createState() => _QuizzViewState();
}

class _QuizzViewState extends State<QuizzView> {
  final bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: CustomPaint(
        painter: LeftHalfScreenPainter(),
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
                child: const Text(
                  "QUESTÃO X/Y",
                  textAlign: TextAlign.center,
                ),
              ),
              FixedSpacer.vNormal,
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: const Text(
                  "Qual é o nome do primeiro membro da tripulação dos Piratas do Chapéu de Palha a se juntar a Monkey D. Luffy?",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              FixedSpacer.vNormal,
              AnswerComponent(title: "Roronoa Zoro", isSelected: _isSelected),
              FixedSpacer.vSmallest,
              AnswerComponent(title: "Nami", isSelected: _isSelected),
              FixedSpacer.vSmallest,
              AnswerComponent(title: "Usopp", isSelected: _isSelected),
              FixedSpacer.vSmallest,
              AnswerComponent(title: "Sanji", isSelected: _isSelected),
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
