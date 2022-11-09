import 'package:flutter/material.dart';
import 'package:loginunittest/constant/constant_view.dart';
import 'package:loginunittest/view/home_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loginunittest/view/signup.dart';
import 'package:loginunittest/constant/local_database.dart';
import '../constant/email_validation.dart';
import '../constant/password_validation.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller_name = TextEditingController();
  final TextEditingController _controller_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(ConstantView.LOGIN_BUTTON),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  image(),
                  const SizedBox(
                    height: 20,
                  ),
                  username(),
                  const SizedBox(
                    height: 20,
                  ),
                  password(),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            var email =
                                LocalDatabase.sharedPreferences.get("email");
                            var password =
                                LocalDatabase.sharedPreferences.get("password");
                            if (email == _controller_name.text &&
                                password == _controller_password.text) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const HomeView())));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Credentials do not match')));
                            }
                          });
                        }
                      },
                      child: Text(ConstantView.LOGIN_BUTTON)),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Signup())));
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'New User??   '),
                          TextSpan(
                            text: 'Signup',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Widget username() {
    return TextFormField(
      //key: key('email'),
      controller: _controller_name,
      //autovalidateMode: AutovalidateMode.always,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Enter professional email id',
        labelText: 'Email *',
      ),

      validator: (value) {
        //return value!.isEmpty ? 'Please enter your name' : null;
        return EmailFieldValidator.validate(value!);
      },
    );
  }

  Widget password() {
    return TextFormField(
      controller: _controller_password,
      //autovalidateMode: AutovalidateMode.always,
      decoration: const InputDecoration(
        icon: Icon(Icons.security),
        hintText: 'Strong password?',
        labelText: 'Password *',
      ),

      validator: (value) {
        // return value!.isEmpty ? 'Please enter password' : null;
        return PasswordFieldValidator.validate(value!);
      },
    );
  }
}
