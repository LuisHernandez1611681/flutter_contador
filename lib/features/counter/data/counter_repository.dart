import 'package:flutter_contador/features/counter/domain/entities/counter.dart';
import 'package:flutter_contador/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  int _counter = 0;

  @override
  Future<Counter> getCounter() async {
    return Counter(_counter);
  }

  @override
  Future<void> updateCounter(int value) async {
    _counter = value;
  }
}