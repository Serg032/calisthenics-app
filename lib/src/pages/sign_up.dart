import 'package:calisthenics_app/src/auth/service.dart';
import 'package:calisthenics_app/src/pages/home.dart';
import 'package:flutter/material.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  SignUpFormPageState createState() => SignUpFormPageState();
}

class SignUpFormPageState extends State<SignUpFormPage> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final surname = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final authService = AuthService();

  Future<void> handleSingUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      bool response = await authService.signUp(
          name.text, surname.text, username.text, email, password);
      print('FINAL: $response');

      if (response) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Form(
          key: _formKey,
          child: Scaffold(
            body: Center(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      spacing: 30,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: 'John'),
                          controller: name,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your surname';
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: 'Doe'),
                          controller: surname,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: 'johnDoe'),
                          controller: username,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter valid email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'athlete@calisthenics.com'),
                          controller: email,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: '123456'),
                          controller: password,
                          obscureText: true,
                        ),
                        ElevatedButton(
                            onPressed: () =>
                                handleSingUp(email.text, password.text),
                            child: Text('Send'))
                      ],
                    ),
                  )
                ],
              ),
            )),
          )),
    );
  }
}
