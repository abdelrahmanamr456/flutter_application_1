import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/customtext.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomWidget(),
    );
  }
}

class CustomWidget extends StatelessWidget {
  CustomWidget({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    login() {
      if (email.text.contains('@') && password.text.isNotEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('success')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('failed')));
      }
      email.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWUcrjyO1fNzqjfWrq1U5em4pTZ_LmIAj-Eg&s',
              ),
              CustomTextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
                labelText: "email",
                obscureText: false,
                obscuringCharacter: "*",
              ),
              const SizedBox(
                height: 17,
              ),
              CustomTextField(
                controller: username,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Icons.abc),
                labelText: "user name",
                obscureText: false,
                obscuringCharacter: "*",
              ),
              const SizedBox(
                height: 17,
              ),
              CustomTextField(
                controller: phonenumber,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone),
                labelText: "phone number",
                obscureText: false,
                obscuringCharacter: "*",
              ),
              const SizedBox(
                height: 17,
              ),
              CustomTextField(
                controller: password,
                obscureText: true,
                obscuringCharacter: "*",
                maxLength: 25,
                labelText: "password",
                suffixIcon: const Icon(Icons.remove_red_eye),
              ),
              const SizedBox(
                height: 17,
              ),
              CustomTextField(
                controller: confirmpassword,
                obscureText: true,
                obscuringCharacter: "*",
                maxLength: 25,
                labelText: "confirm password",
                suffixIcon: const Icon(Icons.remove_red_eye),
              ),
              const SizedBox(
                height: 17,
              ),
              ElevatedButton(onPressed: login, child: const Text('login'))
            ],
          ),
        ),
      ),
    );
  }
}
