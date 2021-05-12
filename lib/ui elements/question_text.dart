import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String question;
  final int questionNumber;

  QuestionText(this.question, this.questionNumber);

  @override
  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    _fontSizeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _fontSizeAnimation = CurvedAnimation(
      parent: _fontSizeAnimationController,
      curve: Curves.bounceOut,
    );
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
          heightFactor: double.parse('+3.0'),
          child: Text(
            'Question ' +
                widget.questionNumber.toString() +
                ': ' +
                widget.question,
            style: TextStyle(fontSize: _fontSizeAnimation.value * 15),
          )),
    );
  }
}
