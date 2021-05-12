import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';

class AnswerOverlay extends StatefulWidget {
  final bool isCorrect;
  final VoidCallback onTap;

  AnswerOverlay(this.isCorrect, this.onTap);

  @override
  _AnswerOverlayState createState() => _AnswerOverlayState();
}

class _AnswerOverlayState extends State<AnswerOverlay>
    with TickerProviderStateMixin {
  Animation<double> _iconSizeAnimation;
  AnimationController _iconSizeAnimationController;

  @override
  void initState() {
    _iconSizeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _iconSizeAnimation = CurvedAnimation(
      parent: _iconSizeAnimationController,
      curve: Curves.bounceOut,
    );
    _iconSizeAnimation.addListener(() => this.setState(() {}));
    _iconSizeAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: Transform.rotate(
                angle: _iconSizeAnimation.value * 2 * pi,
                child: Icon(
                  widget.isCorrect ? Icons.done : Icons.clear,
                  size: _iconSizeAnimation.value * 100,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              widget.isCorrect == true ? 'Correct' : 'Wrong',
              style: TextStyle(
                fontSize: _iconSizeAnimation.value * 35,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
