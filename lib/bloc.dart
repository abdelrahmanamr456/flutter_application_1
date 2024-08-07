import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/abdo33.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class CounterState {
  final int count;

  CounterState(this.count);
}

class State {
  final int m;
  State(this.m);
}

class StateCubit extends Cubit<State> {
  StateCubit() : super(State(5));
  void multiply() {
    emit(State(state.m * 5));
  }

  void minus() {
    emit(State(state.m - 10));
  }
}

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void increment() {
    emit(CounterState(state.count + 1));
  }

  void decrement() {
    emit(CounterState(state.count - 1));
  }

  void reset() {
    emit(CounterState(0));
  }
  //reset
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: BlocBuilder<StateCubit, State>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The current count is:',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 16),
                Text(
                  '${state.m}',
                  //
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<StateCubit>().minus();
                      },
                      child: Text('-'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<StateCubit>().multiply();
                      },
                      child: Text('*'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().reset();
                      },
                      child: Icon(Icons.restore),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
