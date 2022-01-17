import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:islas/controllers/theme/theme_provider.dart';

class DrawerT extends StatelessWidget {
  const DrawerT({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(_) {
    return Drawer(child: Consumer(builder: (_, ref, __) {
      final controller = ref.watch(themeProvider);
      return Center(
        child: MaterialButton(
          onPressed: () {
            controller.changeTheme();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Press the screen to switch to '),
              controller.darkTheme
                  ? const Text('light mode')
                  : const Text('dark mode'),
              const SizedBox(height: 16.0),
              !controller.darkTheme
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
            ],
          ),
        ),
      );
    }));
    // Scaffold(
    //   appBar: AppBar(title: const Text('Switch theme mode')),
    //   body: Consumer(
    //     builder: (_, ref, __) {
    //       final controller = ref.watch(themeProvider);
    //       return Center(
    //         child: MaterialButton(
    //           onPressed: () {
    //             controller.changeTheme();
    //           },
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   const Text('Press the screen to switch to '),
    //                   controller.darkTheme
    //                       ? const Text('light')
    //                       : const Text('dark'),
    //                   const Text(' mode'),
    //                 ],
    //               ),
    //               const SizedBox(height: 16.0),
    //               !controller.darkTheme
    //                   ? const Icon(Icons.dark_mode)
    //                   : const Icon(Icons.light_mode),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
