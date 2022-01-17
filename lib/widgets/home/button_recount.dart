import 'package:flutter/material.dart';
import 'package:islas/controllers/home/home_controller.dart';

class ButtonRecount extends StatelessWidget {
  const ButtonRecount({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      color: Theme.of(context).hintColor,
      //Colors.green.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: () {
        controller.recount();
      },
      child: Text(
        'Recount Islands',
        style: TextStyle(
          color: Colors.grey.shade50,
        ),
      ),
    );
  }
}
