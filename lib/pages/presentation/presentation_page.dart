import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Name Header
          Text(
            'Maxime Parizot',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),

          // Profile Picture
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/profile_picture.png', // Make sure to add your image to assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Introduction Text
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyLarge?.color,
                height: 1.5,
              ),
              children: const [
                TextSpan(
                  text: "Si vous êtes ici, c'est que vous avez pris le temps d'en apprendre plus sur moi, et je vous en remercie.\n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                WidgetSpan(child: SizedBox(height: 50,))
              ,
                TextSpan(
                  text: "À la suite de l’obtention de mon titre professionnel de Concepteur Développeur d’Applications, je suis actuellement à la recherche d’un premier emploi afin d’entamer ma carrière professionnelle dans le métier.\n",
                ),
                WidgetSpan(child: SizedBox(height: 35,)),
                TextSpan(text: "Le monde du développement est pour moi une opportunité de m’épanouir dans un domaine qui m’a toujours intéressé : l’informatique et la technologie.\n"
                    "Ce choix n’a pas été une simple décision d’opportunisme, mais une véritable tentative de renouer avec mon objectif de toujours que je n’ai pu atteindre à la suite de difficultés scolaires et personnel lors de mon enfance.\n"),
                WidgetSpan(child: SizedBox(height: 35,)),
                TextSpan(text:
                "Il m’a fallu pour cela faire mes preuves face à d’autres candidats mieux qualifiés que moi, prouver la force de ma motivation et de mon envie de réussir.\n"),
                WidgetSpan(child: SizedBox(height: 35,)),
                TextSpan(text:
                "Je ne peux prétendre avoir des années d’expérience derrière moi, ou avoir fait des grandes études dans les écoles supérieures, mais je peux vous assurer avoir en moi une capacité d’apprentissage et une persévérance à toute épreuve pour atteindre mon plein potentiel.")
              ],
            ),
          ),
          const SizedBox(height: 40),

          // CV Section
          Text("Mon CV version numérique",style: Theme.of(context).textTheme.headlineSmall,),
          Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 800,
                maxHeight: 1132, // or an appropriate height for your CV image aspect
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(150),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: kIsWeb
                  ? const SizedBox(
                width: 800,
                height: 1132, // match the constraints above
                child: HtmlElementView(viewType: 'cv-image'),
              )
                  : Image.asset(
                'assets/cv.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}