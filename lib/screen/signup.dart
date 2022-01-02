import 'package:ecom_login_project/screen/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  String? validateEmail(String? value) {
    String? _msg;
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value!.isEmpty) {
      _msg = "Your username is required";
    } else if (regex.hasMatch(value)) {
      _msg = "Please provide a valid emal address";
    }
    return _msg;
  }
   String? _userName, _password, _email, _phone, _confirmpassword;
  var _name;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final form = formkey.currentState;

    Signup(name, email, password) async{
      setState(() {
        //isLoading = true;
      });
      print("calling");

      Map data = {
        'email': email,
        'email': password,
        'email': name,
      };
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Text("REGISTER",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Form(
                  //key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.0,),
                      Text("Name"),
                      SizedBox(height: 5.0,),
                      TextFormField(
                        autofocus: false,
                        //validator: validateName,
                        onSaved: (value) => _name = value,
                        //decoration: buildInputDecoration('Enter Name', Icons.email),
                      ),
                      SizedBox(height: 15.0,),
                      Text("Email"),
                      SizedBox(height: 5.0,),
                      TextFormField(
                        autofocus: false,
                        //validator: validateEmail,
                        onSaved: (value) => _email = value,
                        //decoration: buildInputDecoration('Enter Email', Icons.email),
                      ),
                      SizedBox(height: 15.0,),
                      Text("Phone Number"),
                      SizedBox(height: 5.0,),
                      TextFormField(
                        autofocus: false,
                        //validator: validateEmail,
                        onSaved: (value) => _phone = value,
                        //decoration: buildInputDecoration('Enter Phone number', Icons.email),
                      ),
                      SizedBox(height: 20.0,),
                      Text("Password"),
                      SizedBox(height: 5.0,),
                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        validator: (value) => value!.isEmpty?"Please enter password":null,
                        onSaved: (value) => setState(() {
                          _password = value;
                        }),
                        //decoration: buildInputDecoration('Enter Password', Icons.password),
                      ),
                      SizedBox(height: 20.0,),
                      Text("Confirmed Password"),
                      SizedBox(height: 5.0,),
                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        validator: (value) => value!.isEmpty?"Please enter password":null,
                        onSaved: (value) {
                          _confirmpassword = value;
                          setState(() {
                            if(_password == _confirmpassword){
                              _password = _confirmpassword;
                            }
                          });
                          //return ;
                        },
                        //decoration: buildInputDecoration('Enter Password', Icons.password),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                            primary: Colors.red,
                            onPrimary: Colors.teal,
                          ),
                          onPressed: (){
                            print(_email.toString());
                            print(_name.toString());
                            print(_phone.toString());
                            print(_password.toString());
                          },
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                            child: Text("CREATE ACCOUNT",
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
                                Navigator.pop(context);
                              },
                              child: Text("LOGIN",
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
    );
  }

  buildInputDecoration(String s, IconData email) {}


}

Flushbar({required String title, required String message, required Duration duration}) {

}







