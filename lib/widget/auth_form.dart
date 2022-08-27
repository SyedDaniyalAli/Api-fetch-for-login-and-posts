import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);

  final void Function(
    String email,
    String password,
  ) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _userEmail = '';
  var _password = '';

  void _trySubmit() {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState!.save();
      widget.submitFn(
        _userEmail,
        _password,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 165,
            child: FittedBox(
              child: Image.asset('assets/images/lorem.png'),
              fit: BoxFit.cover,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        key: const ValueKey('UserName'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid username.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'User Name',
                        ),
                        onSaved: (value) {
                          _userEmail = value.toString();
                        },
                      ),
                      TextFormField(
                        key: const ValueKey('Password'),
                        onFieldSubmitted: (value) {
                          _trySubmit();
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Password atleast 4 characters long';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        onSaved: (value) {
                          _password = value.toString();
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      MaterialButton(
                        height: 60,
                        minWidth: double.infinity,
                        color: Theme.of(context).primaryColor,
                        onPressed: _trySubmit,
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
