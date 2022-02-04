import 'package:flutter/material.dart';

class LabelNumberIslands extends StatelessWidget {
  const LabelNumberIslands({
    Key? key,
    required this.number,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: number > 1
              ? Text(
                  '$number islands',
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  '$number island',
                  style: TextStyle(
                      color: Colors.blue.shade600, fontWeight: FontWeight.bold),
                )),
    );
  }
}
