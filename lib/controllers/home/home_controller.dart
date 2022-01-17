// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:islas/widgets/home/water_sand_container.dart';

class HomeController extends SimpleNotifier {
  HomeController() {
    _init();
  }
  Future<void> _init() async {
    _loading = true;

    await Future.delayed(const Duration(milliseconds: 124));

    _loading = false;

    notify();
  }

  bool _loading = true;
  bool get loading => _loading;

// to know if is recount of islands
  bool _rc = false;

// to save current number of islads
  int _count = 0;
  int get count => _count;

// to save current matrix
  List<List<int>> _matriz = [];
  List<List<int>> get matriz => _matriz;

// to save values of current matrix in a array
  List<int> _list = [];
  List<int> get list => _list;

  void reloadGrid(int n, List<List<int>> m) {
    _rc = false;

    //createGrid(n, m);

    notify();
  }

  void recount() {
    _rc = true;
    // ignore: avoid_print
    print('-------------new------------');
    makeNewMatriz(_matriz.length, _matriz[0].length, list);
    notify();
  }

  int numIslads(List<List<num>> m) {
    int count = 0;

    int rows = m.length;
    int cols = m[0].length;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (m[i][j] == 1) {
          countIslands(m, i, j, rows, cols);
          count++;
        }
      }
    }

    return count;
  }

  void countIslands(List<List<num>> m, int x, int y, int r, int c) {
    if (x >= r || y >= c || x < 0 || y < 0) {
      return;
    }

    if (x < 0 || y < 0 || y >= m[x].length || x >= m.length || m[x][y] == 0) {
      return;
    }

    m[x][y] = 0;

    countIslands(m, x + 1, y, r, c);
    countIslands(m, x - 1, y, r, c);
    countIslands(m, x, y + 1, r, c);
    countIslands(m, x, y - 1, r, c);
  }

  List<int> makeArray(List<List<int>> matriz) {
    List<int> _array = [];
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        _array.add(_matriz[i][j]);
      }
      // ignore: avoid_print
      print(_matriz[i]);
    }
    return _array;
  }

  makeMatriz(int rows, int cols) => Iterable<List<int>>.generate(
          rows,
          (i) =>
              new List<int>.generate(cols, (j) => Random().nextInt(2)).toList())
      .toList();

  makeNewMatriz(rows, cols, list) {
    int co = 0;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        _matriz[i][j] = list[co];
        co++;
      }
      // ignore: avoid_print
      print(_matriz[i]);
    }

    _count = numIslads(_matriz);
  }

  Widget createGrid(int n, List<List<int>> m) {
    List<int> _listA = [];
    if (_rc == true) {
      if (n == 1) {
        return GridView.builder(
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: 24,
          itemBuilder: (_, int index) {
            return WaterContainer(
              waterOrSand: index,
            );
          },
        );
      }
      if (n == 2) {
        return GridView.builder(
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemCount: 35,
          itemBuilder: (_, int index) {
            return WaterContainer(
              waterOrSand: index,
            );
          },
        );
      }
      return GridView.builder(
        primary: false,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
        ),
        itemCount: 48,
        //35,
        itemBuilder: (_, int index) {
          return WaterContainer(
            waterOrSand: index,
          );
          //return const WaterContainer();
        },
      );
    }

    if (n == 1) {
      _matriz = makeMatriz(6, 4);
      // ignore: avoid_print
      print('--------------6x4----------------');
      _listA = makeArray(_matriz);
      _list = _listA;
      _count = numIslads(_matriz);

      return GridView.builder(
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 24,
        itemBuilder: (_, int index) {
          return WaterContainer(
            waterOrSand: index,
          );
        },
      );
    }
    if (n == 2) {
      _matriz = makeMatriz(7, 5);
      // ignore: avoid_print
      print('--------------7x5----------------');

      _listA = makeArray(_matriz);
      _list = _listA;

      _count = numIslads(_matriz);

      return GridView.builder(
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: 35,
        itemBuilder: (_, int index) {
          return WaterContainer(
            waterOrSand: index,
          );
        },
      );
    }
    _matriz = makeMatriz(8, 6);

    // ignore: avoid_print
    print('--------------8x6----------------');
    _listA = makeArray(_matriz);

    _list = _listA;
    _count = numIslads(_matriz);

    return GridView.builder(
      primary: false,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
      ),
      itemCount: 48,
      //35,
      itemBuilder: (_, int index) {
        return WaterContainer(
          waterOrSand: index,
        );
        //return const WaterContainer();
      },
    );
  }
}
