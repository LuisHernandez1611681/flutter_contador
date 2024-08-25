import 'package:flutter_contador/features/counter/domain/entities/counter.dart';

abstract class CounterRepository {
  Future<Counter> getCounter();
  Future<void> updateCounter(int value);
}