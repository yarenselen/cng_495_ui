// LoginScreen  page

import 'dart:convert';
import 'dart:developer';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cng_495_ui/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypt/crypt.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void navigateToDashboard() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  bool _isObscure = true; // for password field to hide/show password
  String _email = ''; // email field value
  String _password = ''; // password field value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              const Text('Welcome to TradeBuddy!',
                  style: TextStyle(fontSize: 30.0, color: Colors.green)),
              const SizedBox(height: 100.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true, // fill the text field with a color (white)
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true, // fill the text field with a color (white)
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    //navigateToDashboard();
                    // check if email and password are valid
                    if (_email.isNotEmpty && _password.isNotEmpty) {
                      String url =
                          'https://hdshr89om9.execute-api.eu-central-1.amazonaws.com/v1/login';

                      String hh = Crypt.sha256(_password).toString();
                      log(hh);

                      // send post request to https://hdshr89om9.execute-api.eu-central-1.amazonaws.com/v1/login
                      // with email and password
                      http
                          .post(
                        Uri.parse(url),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(<String, String>{
                          'id': _email,
                          'password': _password,
                          'createDate': DateTime.now().toString(),
                          'createDateLong':
                              DateTime.now().millisecondsSinceEpoch.toString(),
                        }),
                      ) // if response is successful
                          .then((response) {
                        // if response is successful
                        if (response.statusCode == 200) {
                          // get response body
                          var responseBody = jsonDecode(response.body);

                          // responseBody is a map

                          // get token from response body
                          var data = responseBody['data'];
                          var success = data['success'];
                          log(success.toString());
                          if (success) {
                            // show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Login successful!'),
                              ),
                            );
                            if (_email == 'admin') {
                              Navigator.pushNamed(context, '/admin');
                            } else {
                              Navigator.pushNamed(context, '/home');
                            }
                          } else {
                            log(response.statusCode.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Invalid email or password'),
                              ),
                            );

                            log('Error: ${response.statusCode}');

                            // clear the email and password fields
                            setState(() {
                              _email = '';
                              _password = '';
                            });

                            // clear the focus from the text fields
                            FocusScope.of(context).unfocus();

                            log('Error: ${response.statusCode}');

                            // show popup dialog with error message
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'Invalid email or password. Do you want to sign up?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.pushNamed(context, '/login');
                                      },

                                      // close the dialog
                                      child: const Text('Sign Up'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      });
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_email.isNotEmpty && _password.isNotEmpty) {
                      String _hh = Crypt.sha256(_password).toString();
                      log('email: $_email, password: $_password, hash: $_hh');
                      // send post request to https://hdshr89om9.execute-api.eu-central-1.amazonaws.com/v1/users
                      // with email and password
                      // if successful, navigate to dashboard
                      // if not, show error message

                      // send post request to https://hdshr89om9.execute-api.eu-central-1.amazonaws.com/v1/users
                      String url =
                          'https://hdshr89om9.execute-api.eu-central-1.amazonaws.com/v1/users';
                      http
                          .post(
                        Uri.parse(url),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(<String, String>{
                          'id': _email,
                          'email': _email,
                          'password': _password,
                          'createDate': DateTime.now().toString(),
                          'createDateLong':
                              DateTime.now().millisecondsSinceEpoch.toString(),
                        }),
                      )
                          .then((response) {
                        // if successful, navigate to dashboard
                        if (response.statusCode == 200) {
                          if (_email == 'admin') {
                            // show error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Sign up failed! Invalid admin attempt!'),
                              ),
                            );

                            Navigator.pushNamed(context, '/login');
                          }
                          // show success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign up successful!'),
                            ),
                          );
                          // navigate to dashboard
                          Navigator.pushNamed(context, '/login');
                        } else {
                          // show error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign up failed!'),
                            ),
                          );
                        }
                      });
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
