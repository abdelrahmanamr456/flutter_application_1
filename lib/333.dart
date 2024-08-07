import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final UserData userData;

  HomeScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UserProfile(userData: userData)),
                      );
                    },
                    child: Text('User Profile'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Log Out'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Incorrect email format';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || !RegExp(r'^\d+$').hasMatch(value)) {
      return 'Phone number must contain numbers only';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null ||
        !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,64}$').hasMatch(value)) {
      return 'Password must be 8-64 characters long, contain at least one uppercase letter, one lowercase letter, and one special character';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      UserData userData = UserData(
        email: _emailController.text,
        username: _usernameController.text,
        phoneNumber: _phoneController.text,
        password: _passwordController.text,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(userData: userData)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: _validateEmail,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: _validatePhoneNumber,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: _validatePassword,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: _validateConfirmPassword,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserData {
  final String email;
  final String username;
  final String phoneNumber;
  final String password;

  UserData({
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.password,
  });
}

class UserProfile extends StatelessWidget {
  final UserData userData;

  UserProfile({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Email: ${userData.email}', style: TextStyle(fontSize: 18)),
            Text('Username: ${userData.username}',
                style: TextStyle(fontSize: 18)),
            Text('Phone Number: ${userData.phoneNumber}',
                style: TextStyle(fontSize: 18)),
            Text('Password: ${userData.password}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
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
