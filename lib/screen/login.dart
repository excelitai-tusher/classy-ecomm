import 'package:ecom_login_project/drawer/home_page.dart';
import 'package:ecom_login_project/screen/home_page.dart';
import 'package:ecom_login_project/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loginpage extends StatefulWidget {
   const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  String? userName, password;

  void login(String email, password) async {
    try {
      final response = await post(
          Uri.parse(
              'https://classyecommerce.excelitaiportfolio.com/api/user/login'),
          body: {
            'email': email,
            'password': password,
          }
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        Navigator.push(context,MaterialPageRoute(
            builder: (Context)=> Homepage()));
      } else {
        print('failed');
      }
    }
    catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Login', style: TextStyle(color: Colors.black, fontSize: 30),),
                  TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Please type an email";
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Enter Your Email'),
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input!.length < 6) {
                        return "your password needs to be atlest 6 characters";
                      }
                    },
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  //SizedBox(height: 80,),
                  RaisedButton(
                    color: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                    onPressed: () {
                      print("Successfully");
                      // Loginpage(
                      //     emailController.text.toString(),
                      //     passwordController.text.toString(),
                      // );
                    },
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (Context)=> Homepage()));
                      },
                      child: Text('Login',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20),),
                    ),
                  ),
                  //SizedBox(height: 20,),

                  Text('OR LOGIN WITH',
                    style: TextStyle(color: Colors.black54, fontSize: 15),),
                  //SizedBox(height: 130,),


                  Text('HAVE NOT ACCOUNT YET ?',
                    style: TextStyle(color: Colors.black54, fontSize: 15),),

                  SizedBox(height: 40,),

                  InkWell(
                    // onTap: (){
                    //   Navigator.push(context,MaterialPageRoute(
                    //       builder: (Context)=>Registation()));
                    // },
                    child: Text('SIGN UP',
                      style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
