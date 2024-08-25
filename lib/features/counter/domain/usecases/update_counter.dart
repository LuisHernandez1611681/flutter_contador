import 'package:flutter_contador/features/counter/domain/repositories/counter_repository.dart';

class UpdateCounter {
  final CounterRepository repository;

  UpdateCounter(this.repository);

  Future<void> call({int delta = 0}) async {
    final currentCounter = await repository.getCounter();
    final newCounterValue = currentCounter.value + delta;
    await repository.updateCounter(newCounterValue);
  }
}