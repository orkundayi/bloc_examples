import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc Test'),
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.wasIncremented == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Incremented!'),
                  duration: Duration(milliseconds: 300),
                ),
              );
            } else if (state.wasIncremented == false) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Decremented!'),
                  duration: Duration(milliseconds: 300),
                ),
              );
            }
            if (state.isInProgress) {
              Future.delayed(const Duration(milliseconds: 500), () {
                BlocProvider.of<CounterCubit>(context).reset();
              });
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter Value: ${state.counterValue}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 24),
                if (state.isInProgress)
                  const SizedBox(height: 36, child: CircularProgressIndicator.adaptive())
                else
                  SizedBox(
                    height: 36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).decrement();
                          },
                          child: const Text('Decrement'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CounterCubit>().increment();
                          },
                          child: const Text('Increment'),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).reset(resetNumber: true);
        },
        child: const Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}
