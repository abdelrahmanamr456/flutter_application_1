import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CalculatorCubit(),
        child: CalculatorScreen(),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              decoration: InputDecoration(labelText: 'First Number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration: InputDecoration(labelText: 'Second Number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate(context, 'add'),
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate(context, 'subtract'),
                  child: Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate(context, 'multiply'),
                  child: Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate(context, 'divide'),
                  child: Text('Divide'),
                ),
              ],
            ),
            SizedBox(height: 20),
            BlocBuilder<CalculatorCubit, double>(
              builder: (context, result) {
                return Text(
                  'Result: $result',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _calculate(BuildContext context, String operation) {
    final double num1 = double.tryParse(_num1Controller.text) ?? 0;
    final double num2 = double.tryParse(_num2Controller.text) ?? 0;

    final calculatorCubit = context.read<CalculatorCubit>();

    switch (operation) {
      case 'add':
        calculatorCubit.add(num1, num2);
        break;
      case 'subtract':
        calculatorCubit.subtract(num1, num2);
        break;
      case 'multiply':
        calculatorCubit.multiply(num1, num2);
        break;
      case 'divide':
        calculatorCubit.divide(num1, num2);
        break;
    }
  }
}

class CalculatorCubit extends Cubit<double> {
  CalculatorCubit() : super(0);

  void add(double num1, double num2) {
    emit(num1 + num2);
  }

  void subtract(double num1, double num2) {
    emit(num1 - num2);
  }

  void multiply(double num1, double num2) {
    emit(num1 * num2);
  }

  void divide(double num1, double num2) {
    if (num2 != 0) {
      emit(num1 / num2);
    } else {
      emit(double.nan); // Handle division by zero
    }
  }
}
