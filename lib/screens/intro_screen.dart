import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        body: 'Everything you need in the world of packaging is here',
        title: 'Welcome To Altohamy pack',
        image: SizedBox(
            width: 300,
            height: 500,
            child: Image.asset(
              'assets/images/logo-no-background.png',
            )),
        decoration: const PageDecoration(
            bodyTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
            pageColor: Colors.white,
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 23))),
    PageViewModel(
        image: SizedBox(
            width: 400,
            height: 500,
            child: Image.asset(
                'assets/images/H9fae854522eb48439a4b3d00eed41b224.jpg_960x960.webp')),
        body: 'The best types of aluminum maintain heat for the largest period',
        title: ' Al-Tohamy For Foil',
        decoration: const PageDecoration(
            bodyTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
            pageColor: Colors.white,
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 23))),
    PageViewModel(
        body:
            'Al-Tohamy Company is distinguished in the manufacture of the finest types of plastic bags',
        title: 'Al-Tohamy for plastic bags',
        image: Image.asset(
            'assets/images/دراسة-جدوى-مشروع-مصنع-اكياس-بلاستيك.jpg'),
        decoration: const PageDecoration(
            bodyTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 23))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: IntroductionScreen(
        back: const Text('back'),
        pages: pages,
        showBackButton: true,
        dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Colors.blue,
            activeSize: Size.square(15),
            activeColor: Colors.purple),
        done: const Text('Done'),
        onDone: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        },
        showDoneButton: true,
        showNextButton: true,
        next: const Text('next'),
        curve: Curves.bounceOut,
      ),
    );
  }
}
