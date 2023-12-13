import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kurs04/app_constants/colors/app_colors.dart';

import 'package:kurs04/providers/dice_random_numbes_provider.dart';
import 'package:kurs04/widgets/dice_widget.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        title: const Text(
          'Dicee',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final diceProvider =
                    ref.watch(diceRandomNumbersNotifierProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DiceWidget(
                      onPressed: () => ref
                          .read(diceRandomNumbersNotifierProvider.notifier)
                          .changeDice(),
                      diceNumber: diceProvider.left.toString(),
                    ),
                    DiceWidget(
                      onPressed: () => ref
                          .read(diceRandomNumbersNotifierProvider.notifier)
                          .changeDice(),
                      diceNumber: diceProvider.right.toString(),
                    ),
                  ],
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return TextButton(
                  onPressed: () {
                    ref
                        .read(diceRandomNumbersNotifierProvider.notifier)
                        .restart();
                  },
                  child: const Text(
                    'Restart',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
