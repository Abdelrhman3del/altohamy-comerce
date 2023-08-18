import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text('Flutter Dev:Abdelrahman Adel Abdslam Mohamed'),
            SizedBox(
              height: 100,
            ),
            Text('Flutter Dev: Hager yasser Ahmad elsherbiny')
          ],
        ),
      ),
    );
  }
}

class StoreInfo extends StatelessWidget {
  const StoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.purple),
            child: const Center(
              child: Text(
          'A store for Al-Tohamy Packaging Company, in which everything related to food packaging is sold',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
            )),
        SizedBox(
          height: 100,
        ),
      ],
    )));
  }
}
