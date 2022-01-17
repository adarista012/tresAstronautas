import 'package:flutter/material.dart';
import 'package:islas/controllers/home/home_controller.dart';

class LabelNumberIslands extends StatelessWidget {
  const LabelNumberIslands({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: controller.count > 1
              ? Text(
                  '${controller.count} islands',
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  '${controller.count} island',
                  style: TextStyle(
                      color: Colors.blue.shade600, fontWeight: FontWeight.bold),
                )),
    );
  }
}
