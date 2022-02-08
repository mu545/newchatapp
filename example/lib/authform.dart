import 'dart:io';

import 'package:flutter/material.dart';

import 'imagepicker.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String username, String pass, bool isLogin,
      File imagess, BuildContext ctx) submitfn;
  AuthForm(this.submitfn);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formket = GlobalKey<FormState>();
  bool _isLogin = true;

  File _userimage = File('file.image');
  File pickimage = File('file.image');
  void _pikedimage(pickimage) {
    File _ussername = pickimage;
    String _email = '';
    String _pass = '';
    String _username = '';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formket,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!_isLogin) ImagePickersss(),
                TextFormField(
                  key: ValueKey('email'),
                  validator: (val) {
                    if (val!.isEmpty || val.contains('@')) {
                      return null;
                    }

                    return 'please enter a valid email';
                  },
                  decoration: InputDecoration(labelText: 'Enter email'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) => _email = val,
                ),
                if (!_isLogin)
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (val) {
                      if (val!.isEmpty || val.length > 6) {
                        return null;
                      }

                      return 'please enter a username more than 6 ';
                    },
                    decoration: InputDecoration(labelText: 'Enter username'),
                    onSaved: (val) => _username = val!,
                  ),
                TextFormField(
                  key: ValueKey('pass'),
                  validator: (val) {
                    if (val!.isEmpty || val.length > 6) {
                      return null;
                    }
                    return 'please enter a password more than 6 ';
                  },
                  decoration: InputDecoration(labelText: 'Enter password'),
                  onSaved: (val) => _pass = val,
                  obscureText: true,
                ),
                SizedBox(),
                RaisedButton(
                  color: Colors.grey,
                  child: Text(_isLogin ? 'Login' : 'SignUp'),
                  onPressed: () {},
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(
                      _isLogin ? 'create account' : 'Already have account'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
