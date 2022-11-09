import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loginunittest/view/login_view.dart';

import '../constant/constant_view.dart';
import '../constant/email_validation.dart';
import '../constant/local_database.dart';
import '../constant/password_validation.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller_name = TextEditingController();
  final TextEditingController _controller_username = TextEditingController();
  final TextEditingController _controller_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (() => Navigator.pop(context)),
              child: const Icon(Icons.arrow_back_ios)),
          title: Text(ConstantView.SIGNUP_BUTTON),
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
                  name(),
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
                          LocalDatabase.sharedPreferences
                              .setString("email", _controller_username.text);
                          LocalDatabase.sharedPreferences
                              .setString("password", _controller_password.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginView())));
                        }
                      },
                      child: Text(ConstantView.SIGNUP_BUTTON)),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Widget name() {
    return TextFormField(
      //key: key('email'),
      controller: _controller_name,
      //autovalidateMode: AutovalidateMode.always,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Enter your name',
        labelText: 'Name *',
      ),

      validator: (value) {
        //return value!.isEmpty ? 'Please enter your name' : null;
        return EmailFieldValidator.validate(value!);
      },
    );
  }

  Widget username() {
    return TextFormField(
      //key: key('email'),
      controller: _controller_username,
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
