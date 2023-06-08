import 'package:flutter/material.dart';
import 'package:quizz_gpt_app/views/quizz_vew.dart';
import 'package:quizz_gpt_app/widgets/fixed_spacer.dart';
import '../widgets/wave_shape.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue[200],
          ),
          CustomPaint(
            painter: WavePainter(),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FixedSpacer.vBiggest,
                    FixedSpacer.vBig,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),
                      child: Image.asset(
                        "assets/images/luffy_profile.png",
                        height: 250,
                        width: 250,
                      ),
                    ),
                    FixedSpacer.vBiggest,
                    RichText(
                      text: const TextSpan(
                          text: "Bem-Vind@ ao Quizz de ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 23),
                          children: <TextSpan>[
                            TextSpan(
                              text: "One Piece",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OnePiece',
                                  fontSize: 28),
                            )
                          ]),
                    ),
                    FixedSpacer.vBiggest,
                    const SizedBox(
                      width: 400,
                      child: Text(
                        "Bem-vind@ ao nosso aplicativo de perguntas e respostas sobre One Piece! \n Prepare-se para mergulhar no incrível mundo dos piratas, aventuras emocionantes e mistérios cativantes. \nEstamos aqui para ajudá-lo a explorar e aprofundar seu conhecimento sobre esse anime épico.\n Divirta-se e embarque nessa jornada inesquecível!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FixedSpacer.vBiggest,
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QuizzView()),
                          );
                        },
                        child: const Text("Vamos começar!"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
