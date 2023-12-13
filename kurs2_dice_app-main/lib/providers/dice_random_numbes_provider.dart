import 'dart:math';

import 'package:kurs04/models/dice_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dice_random_numbes_provider.g.dart';

@riverpod
class DiceRandomNumbersNotifier extends _$DiceRandomNumbersNotifier {
  @override
  DiceModel build() {
    return const DiceModel(right: 1, left: 3);
  }

  void changeDice() {
    final random = Random();

    final diceModel = DiceModel(
      right: random.nextInt(6) + 1,
      left: random.nextInt(6) + 1,
    );

    state = diceModel;
  }

  void restart() {
    const diceModel = DiceModel(
      right: 1,
      left: 1,
    );

    state = diceModel;
  }
}
