import 'package:flutter/material.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  SignUpFormPageState createState() {
    return SignUpFormPageState();
  }
}

class SignUpFormPageState extends State<SignUpFormPage> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  void handleSingUp(String email, String password) {
    if (_formKey.currentState!.validate()) {
      print('Correct validaton. Email: $email. Password: $password');
    } else {
      print('Something went wrong');
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
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration:
                              InputDecoration(hintText: 'calistenic@gmail.com'),
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
