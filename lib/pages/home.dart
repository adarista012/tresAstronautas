import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:islas/controllers/home/home_controller.dart';
import 'package:islas/controllers/home/home_provider.dart';
import 'package:islas/widgets/home/drawer.dart';

import 'package:islas/widgets/home/button_recount.dart';
import 'package:islas/widgets/home/label_number_islands.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int gridSize = 0; // 1 = 6x4, 2 = 7x5, 3 = 8x6
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appB(),
      drawer: const DrawerT(),
      body: Consumer(builder: (_, ref, __) {
        final controller = ref.watch(homeProvider);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 7,
                  child: Center(
                    child: gridViewC(controller, gridSize),
                  )),
              Expanded(
                flex: 2,
                child: ListView(
                  primary: false,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonReloadGrid(controller, 1, '6x4', context),
                        buttonReloadGrid(controller, 2, '7x5', context),
                        buttonReloadGrid(controller, 3, '8x6', context),
                      ],
                    ),
                    LabelNumberIslands(controller: controller),
                    ButtonRecount(controller: controller),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget gridViewC(HomeController controller, int grid) {
    if (controller.loading) {
      return const CircularProgressIndicator();
    }
    if (grid == 0) {
      if (controller.loading) {
        return const CircularProgressIndicator();
      }
      return controller.createGrid(3, []);
    }
    return controller.createGrid(grid, []);
  }

  MaterialButton buttonReloadGrid(
      HomeController controller, int grid, String label, BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(6.0),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: () {
        // setState(() {
        gridSize = grid;
        controller.reloadGrid(gridSize, []);
        // });
      },
      child: Text('Reload grid $label',
          style: TextStyle(
            color: Colors.grey.shade100,
            fontSize: 12.0,
          )),
    );
  }

  // AppBar appB() => AppBar(title: Text(widget.title));
  AppBar appB() {
    return AppBar(
      title: Text(widget.title),
    );
  }
}
