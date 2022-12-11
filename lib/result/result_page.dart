import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;
  
  const ResultPage({Key? key, required this.title, required this.length, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text("Parabéns!", style: AppTextStyles.heading40),
                SizedBox(height: 16,),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu\n", 
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        style: AppTextStyles.bodyBold,
                        text: "${title} \n",
                      ),
                      TextSpan(
                        text: "com ${result} de ${length} acertos.",
                        style: AppTextStyles.body,
                      ),
                    ]
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(label: "Compartilhar", onTap: (){
                        Share.share("DEV QUIZ NLW5 - Flutter: Resultados do Quiz: $title\n Obtive:$result de $length pontos");
                      }),
                    )),
                  ],
                ),
                SizedBox(height: 24,),
                Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.white(label: "Voltar ao início", onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      }),
                    )),
                  ],
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
