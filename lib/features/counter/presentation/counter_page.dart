import 'package:flutter/material.dart';
import 'package:flutter_contador/features/counter/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterStateProvider);

    return Scaffold(
      // Titulo
      appBar: AppBar(
        title: const Text('Counter'),
      ),

      // Cuerpo
      body: Center(
        child: counterState.when(
          data: (counter) => Text('Counter value ${counter.value}', style: const TextStyle(fontSize: 32)), 
          error: (e, stack) => Text('Error: $e'), 
          loading: () => const CircularProgressIndicator()
        ),
      ),

      // Boton flotante
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final currentCounter = await ref.read(counterStateProvider.future);
          final newCounterValue = currentCounter.value + 1;

          // Cambiamos su valor
          await ref.read(updateCounterProvider).call(newCounterValue);
          ref.refresh(counterStateProvider);
        },
        child: const Icon(Icons.add),
      ),

    );
  }
  
}