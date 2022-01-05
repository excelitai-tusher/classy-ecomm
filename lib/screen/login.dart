import 'package:ecom_login_project/providers/auth_provide.dart';
import 'package:ecom_login_project/screen/signup.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  String? _userName, _password;

  String? validateEmail(String? value) {
    String? _msg;
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value!.isEmpty) {
      _msg = "Your username is required";
    } else if (!regex.hasMatch(value)) {
      _msg = "Please provide a valid email address";
    }
    return _msg;
  }
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    var dologin = (){
      final form = formkey.currentState;
      if(form!.validate()){
        form.save();
        final Future<Map<String,dynamic>> response = auth.login(_userName!, _password!);
      }else{
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        );
      }
    };
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Text("LOGIN",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 10,),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.0,),
                        Text("Email"),
                        SizedBox(height: 5.0,),
                        TextFormField(
                          autofocus: false,
                          validator: validateEmail,
                          onSaved: (value) => _userName = value!,
                          decoration: buildInputDecoration('Enter Email', Icons.email),
                        ),
                        SizedBox(height: 20.0,),
                        Text("Password"),
                        SizedBox(height: 5.0,),
                        TextFormField(
                          autofocus: false,
                          obscureText: true,
                          validator: (value) => value!.isNotEmpty?"Please enter password":null,
                          onSaved: (value) => _password = value!,
                          decoration: buildInputDecoration('Enter Password', Icons.password),
                        ),
                        SizedBox(height: 20,),
                        longButtons(Login, dologin),
                        SizedBox(height: 20,),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                              primary: Colors.red,
                              onPrimary: Colors.teal,
                            ),
                              onPressed: (){},
                              child: InkWell(
                                // onTap: (){
                                //   Navigator.push(context,MaterialPageRoute(builder: (context) => Signup()),
                                //   );
                                // },
                                child: Text("Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: Column(
                            children: [
                              Text("HAVE NOT ACCOUNT YET?",
                                style: TextStyle(
                                  color: Colors.black12,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => Signup()),
                                  );
                                },
                                child: Text("SIGN UP",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildInputDecoration(String s, IconData email) {}

}

longButtons(Type login, Null Function() dologin) {
}








