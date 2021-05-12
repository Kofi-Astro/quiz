import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool value;
  final VoidCallback onTap;

  AnswerButton(this.value, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: value == true ? Colors.greenAccent : Colors.redAccent,
        child: InkWell(
          onTap: () => onTap(),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(
                style: BorderStyle.solid,
                color: Colors.white,
                width: 5.0,
              )),
              child: Text(
                value == true ? 'TRUE' : 'FALSE',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
