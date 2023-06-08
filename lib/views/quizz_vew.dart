import 'package:flutter/material.dart';
import 'package:quizz_gpt_app/widgets/answer_component.dart';
import 'package:quizz_gpt_app/widgets/fixed_spacer.dart';

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
      body: Padding(
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
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                "QUESTÃO X/Y",
                textAlign: TextAlign.center,
              ),
            ),
            FixedSpacer.vNormal,
            const SizedBox(
              width: double.infinity,
              child: Text("AQUI VAI A PERGUNTA"),
            ),
            FixedSpacer.vNormal,
            AnswerComponent(title: "ALTERNATIVA", isSelected: _isSelected),
            FixedSpacer.vSmallest,
            AnswerComponent(title: "ALTERNATIVA", isSelected: _isSelected),
            FixedSpacer.vSmallest,
            AnswerComponent(title: "ALTERNATIVA", isSelected: _isSelected),
            FixedSpacer.vBiggest,
            FixedSpacer.vBiggest,
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
    );
  }
}
