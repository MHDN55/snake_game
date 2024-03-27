import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<int> snakePosition = [45, 65, 85, 105, 125];

  int numberOfSquares = 560;

  static var randomNumber = Random();

  int food = randomNumber.nextInt(500);

  void generateNewFood() {
    food = randomNumber.nextInt(500);
  }

  void startGame() {
    snakePosition = [45, 65, 85, 105, 125];

    const duration = Duration(milliseconds: 300);

    Timer.periodic(
      duration,
      (Timer timer) {
        updateSnake();
        if (gameOver()) {
          timer.cancel();
          _showGameOverScreen();
        }
      },
    );
  }

  var direction = 'down';

  void updateSnake() {
    setState(
      () {
        switch (direction) {
          case 'down':
            if (snakePosition.last > 540) {
              snakePosition.add(snakePosition.last + 20 - 560);
            } else {
              snakePosition.add(snakePosition.last + 20);
            }
            break;

          case 'up':
            if (snakePosition.last < 20) {
              snakePosition.add(snakePosition.last - 20 + 560);
            } else {
              snakePosition.add(snakePosition.last - 20);
            }
            break;

          case 'left':
            if (snakePosition.last % 20 == 0) {
              snakePosition.add(snakePosition.last - 1 + 20);
            } else {
              snakePosition.add(snakePosition.last - 1);
            }
            break;

          case 'right':
            if ((snakePosition.last + 1) % 20 == 0) {
              snakePosition.add(snakePosition.last + 1 - 20);
            } else {
              snakePosition.add(snakePosition.last + 1);
            }
            break;

          default:
        }
        if (snakePosition.last == food) {
          generateNewFood();
        } else {
          snakePosition.removeAt(0);
        }
      },
    );
  }

  bool gameOver() {
    for (int i = 0; i < snakePosition.length; i++) {
      int count = 0;
      for (int j = 0; j < snakePosition.length; j++) {
        if (snakePosition[i] == snakePosition[j]) {
          count += 1;
        }
        if (count == 2) {
          return true;
        }
      }
    }
    return false;
  }

  void _showGameOverScreen() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("GAME OVER"),
          content: Text("You're score: ${snakePosition.length}"),
          actions: [
            MaterialButton(
              onPressed: () {
                startGame();
                context.pop();
              },
              child: const Text("Play Again"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (direction != 'up' && details.delta.dy > 0) {
                  direction = 'down';
                } else if (direction != 'down' && details.delta.dy < 0) {
                  direction = 'up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (direction != 'left' && details.delta.dx > 0) {
                  direction = 'right';
                } else if (direction != 'right' && details.delta.dx < 0) {
                  direction = 'left';
                }
              },
              child: SizedBox(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 20,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (snakePosition.contains(index)) {
                      return Center(
                        child: Container(
                          color: Colors.white,
                        ),
                      );
                    }
                    if (index == food) {
                      return Container(
                        color: Colors.green,
                      );
                    } else {
                      return Container(
                        color: Colors.grey[800],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h, left: 2.w, right: 2.w),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              onPressed: startGame,
              child: Center(
                child: Text(
                  "S t a r t",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
