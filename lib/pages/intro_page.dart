import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restaurant/components/button.dart';
import 'package:sushi_restaurant/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 25.0,
              ),
              // shop name
              Text(
                'TANOSHI SUSHI',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              // icon
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.network(
                    'https://static.wixstatic.com/media/f8cc3e_2c1cc36b97ca4ecc8f5804972c70c295~mv2.png'),
              ),
              const SizedBox(
                height: 25.0,
              ),
              // title
              Text(
                "IT'S NOT FOOD \nIT'S A GOOD MOOD",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // subtitle
              Text(
                "Feel the taste of the most popular Japanese food from anywhere and anytime.",
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              // get started button
              MyButton(
                text: "Get started",
                onTap: () {
                  // go to menu page
                  Navigator.pushNamed(context, '/menupage');
                },
              ),
            ],
          ),
        ));
  }
}
