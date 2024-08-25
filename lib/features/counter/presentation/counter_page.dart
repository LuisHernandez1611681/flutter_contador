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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Incrementar
          FloatingActionButton(
            onPressed: () async {
              await ref.read(updateCounterProvider).call(delta: 1);
              ref.invalidate(counterStateProvider);
            },
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 10),

          // Decremento
          FloatingActionButton(
            onPressed: () async {
              await ref.read(updateCounterProvider).call(delta: -1);
              ref.invalidate(counterStateProvider);
            },
            child: const Icon(Icons.remove),
          )
      
        ],
      )

    );
  }
  
}