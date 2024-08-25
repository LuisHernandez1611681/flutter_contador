import 'package:flutter_contador/features/counter/data/counter_repository.dart';
import 'package:flutter_contador/features/counter/domain/repositories/counter_repository.dart';
import 'package:flutter_contador/features/counter/domain/usecases/get_counter.dart';
import 'package:flutter_contador/features/counter/domain/usecases/update_counter.dart';
import 'package:riverpod/riverpod.dart';

final counterRepositoryProvider = Provider<CounterRepository>((ref) {
  return CounterRepositoryImpl();
});

// Casos de uso
final getCounterProvider = Provider<GetCounter>((ref) {
  final repository = ref.watch(counterRepositoryProvider);
  return GetCounter(repository);
});

final updateCounterProvider = Provider<UpdateCounter>((ref) {
  final repository = ref.watch(counterRepositoryProvider);
  return UpdateCounter(repository);
});

final counterStateProvider = FutureProvider((ref) async {
  final getCounter = ref.watch(getCounterProvider);
  final counter = await getCounter();
  return counter;
});


