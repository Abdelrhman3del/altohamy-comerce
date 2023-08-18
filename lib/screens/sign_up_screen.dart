import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();

  void validSign() {
    _key.currentState!.validate();
  }
  late final String email;
  late final String ?password;

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _nameController = TextEditingController();

  final _numberController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _nameController.dispose();
  }

  Future signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.value.text,
        password: _passwordController.text,
      );
      showDialog(
          context: context,
          builder: (c) {
            return AlertDialog(
              title: const Text('Success Created'),
              content: const Text('you can login now'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('cancel'))
              ],
            );
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
            context: context,
            builder: (s) {
              return const AlertDialog(
                title: Text(
                  'weak-password',
                ),
                content: Text('The password provided is too weak.'),
              );
            });
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showDialog(
            context: context,
            builder: (c) {
              return const AlertDialog(
                title: Text('email-already-in-use'),
                content: Text('The account already exists for that email.'),
              );
            });
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 100,
                    child: Image.asset('assets/images/download.webp'),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'SignUp',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
            /*    buildFormField(
                  label: 'your name',
                  formFieldValidator: (value) {
                    if (value.toString().isEmpty) {
                      return 'please enter your user name';
                    } else {
                      return null;
                    }
                  },
                  preIcon: const Icon(Icons.drive_file_rename_outline),
                  sufIcon: const Icon(Icons.contact_emergency_sharp),
                  textInputType: TextInputType.name,
                  textEditingController: _nameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                buildFormField(
                    label: 'number',
                    formFieldValidator: (value) {
                      if (value.toString().length < 11) {
                        return 'please commplet your number';
                      } else if (value.toString().isEmpty) {
                        return 'please enter your number';
                      } else {
                        return null;
                      }
                    },
                    preIcon: const Icon(Icons.numbers_outlined),
                    sufIcon: const Icon(Icons.account_circle),
                    textInputType: TextInputType.number,
                    textEditingController: _numberController),
                const SizedBox(
                  height: 20,
                ),*/
                buildFormField(
                    label: 'email',
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
                  height: 20,
                ),
                buildFormField(
                    label: 'password',
                    formFieldValidator: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter your password';
                      } else if (value.toString().length < 8) {
                        return 'your password should greater than 8 letters';
                      } else {
                        return null;
                      }
                    },
                    preIcon: const Icon(Icons.password),
                    sufIcon: const Icon(Icons.remove_red_eye_outlined),
                    textInputType: TextInputType.text,
                    textEditingController: _passwordController),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async{
                    validSign();
                 await   signUp();
                  },
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.purple),
                      child: const Center(
                          child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No I have account '),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()));
                        },
                        child: const Text('Login Now'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
