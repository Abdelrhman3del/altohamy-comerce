import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../widget.dart';
import 'home_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    bool _isValid = false;
    final key = GlobalKey<FormState>();
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
    }

    void _saveForm() {
      key.currentState!.validate();
    }

    Future SignIn() async {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim()
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          return const AlertDialog(
            title: Text('user-not-found'),
            content: Text(
              'No user found for that email, SignUp and try again',
              style: TextStyle(color: Colors.red),
            ),
          );

          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          return AlertDialog(
            title: const Text(
              'Wrong password',
              style: TextStyle(color: Colors.red),
            ),
            content: const Text('Wrong password provided for that user'),
            actions: [
              InkWell(
                child: const Text(
                  'ok',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                onTap: () {},
              )
            ],
          );

        }
      }
    }

    return Scaffold(
      body: SafeArea(
          child: Form(
        key: key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Center(
                    child: SizedBox(
                        height: 100,
                        width: 200,
                        child: Image.asset('assets/images/download.webp'))),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildFormField(
                    label: 'E-mail',
                    formFieldValidator: (value) {
                      // Check if this field is empty
                      if (value == null || value.isEmpty) {
                        return 'please enter your email';
                      }
                      // using regular expression
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      } else {
                        return null;
                      }
                    },
                    preIcon: const Icon(Icons.alternate_email_outlined),
                    sufIcon: const Icon(Icons.email_outlined),
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController),
                const SizedBox(
                  height: 30,
                ),
                buildFormField(
                    label: 'Password',
                    formFieldValidator: (v) {
                      if (v.toString().isEmpty) {
                        return 'please enter password';
                      } else {
                        return null;
                      }
                    },
                    preIcon: const Icon(Icons.password),
                    sufIcon: const Icon(Icons.remove_red_eye_outlined),
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _passwordController),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    _saveForm();
                    SignIn();
                  },
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.purple),
                      child: const Center(
                          child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do you have account ?'),
                    TextButton(
                      onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>  SignUpScreen()));
                      },
                      child: const Text('Sign Up Now'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
/*
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Processing Data')),
);*/
