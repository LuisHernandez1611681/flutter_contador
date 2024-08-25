import 'package:flutter_contador/features/counter/domain/repositories/counter_repository.dart';

class UpdateCounter {
  final CounterRepository repository;

  UpdateCounter(this.repository);

  Future<void> call(int value) async {
    await repository.updateCounter(value);
  }
}