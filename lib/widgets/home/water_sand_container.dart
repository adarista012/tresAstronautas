import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:islas/controllers/home/home_provider.dart';

class WaterContainer extends StatefulWidget {
  final int waterOrSand;
  const WaterContainer({
    Key? key,
    required this.waterOrSand,
  }) : super(key: key);

  @override
  State<WaterContainer> createState() => _WaterContainerState();
}

class _WaterContainerState extends State<WaterContainer> {
  //bool isWater = Random().nextBool();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final controller = ref.watch(homeProvider);
      final List<int> l = controller.list;
      //print(l[widget.waterOrSand]);
      bool isWater = l[widget.waterOrSand] == 0 ? true : false;
      return Container(
        child: MaterialButton(
          onPressed: () {
            setState(() {
              //isWater = !isWater;
              controller.list[widget.waterOrSand] =
                  controller.list[widget.waterOrSand] == 0 ? 1 : 0;
            });
          },
          child: Center(
            child: isWater
                ? const Text(
                    '0',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                : const Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        color: isWater ? Colors.blue[200] : Colors.brown[400],
      );
    });
  }
}
