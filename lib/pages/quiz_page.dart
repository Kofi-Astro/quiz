import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui elements/question_text.dart';
import '../ui elements/answer.dart';
import '../ui elements/answer_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Questions _currentQuestion;
  Quiz _quiz = Quiz(
    [
      Questions('Are you sure', false),
      Questions('Are you a boy?', true),
    ],
  );
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    _currentQuestion = _quiz.nextQuestion;
    questionText = _currentQuestion.question;
    questionNumber = _quiz.questionNumber;

    super.initState();
  }

  void handleOverlay(bool option) {
    isCorrect = (_currentQuestion.answer == option);
    _quiz.answer(isCorrect);

    this.setState(() {
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            AnswerButton(true, () => handleOverlay(true)),
            QuestionText(questionText, questionNumber),
            AnswerButton(false, () => handleOverlay(false)),
          ],
        ),
        overlayVisible == true
            ? AnswerOverlay(isCorrect, () {
                _currentQuestion = _quiz.nextQuestion;
                this.setState(() {
                  overlayVisible = false;
                  questionNumber = _quiz.questionNumber;
                  questionText = _currentQuestion.question;
                });
              })
            : Container(),
      ],
    );
  }
}
