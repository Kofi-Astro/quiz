import 'package:flutter/material.dart';

import './quiz_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => (QuizPage()),
              ));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "LET'S QUIZ",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Tap the screen to start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ))
          ],
        ),
      ),
    );
  }
}
