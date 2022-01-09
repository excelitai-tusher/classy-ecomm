import 'dart:math';
import 'package:ecom_login_project/drawer/home_page.dart';
import 'package:ecom_login_project/screen/home_page.dart';
import 'package:ecom_login_project/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController reponseController = TextEditingController();
  TextEditingController ConfirmedController = TextEditingController();


  String? email, password, phone, name, reponse;

  void Login(String email, password, phone, name) async{
    try{
       Response response = await post(
          Uri.parse('https://classyecommerce.excelitaiportfolio.com/api/user/registration'),
          body:{
            "email": email,
            "password": password,
            "name": name,
            "phone": phone,
        },
      );
       if(response.statusCode == 200){
         print(response.statusCode);
         Navigator.push(context, MaterialPageRoute(builder: (Context)=> Homepage()));
       }else{
         print('failed');
       }

    }catch(e){
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
                        onSaved: (value) => name = value,
                        //decoration: buildInputDecoration('Enter Name', Icons.email),
                      ),
                      SizedBox(height: 15.0,),
                      Text("Email"),
                      SizedBox(height: 5.0,),
                      TextFormField(
                        controller: emailController,
                        autofocus: false,
                        //validator: validateEmail,
                        onSaved: (value) => email = value,
                        //decoration: buildInputDecoration('Enter Email', Icons.email),
                      ),
                      SizedBox(height: 15.0,),
                      Text("Phone Number"),
                      SizedBox(height: 5.0,),
                      TextFormField(
                        autofocus: false,
                        //validator: validateEmail,
                        onSaved: (value) => phone = value,
                        //decoration: buildInputDecoration('Enter Phone number', Icons.email),
                      ),
                      SizedBox(height: 20.0,),
                      Text("Password"),
                      SizedBox(height: 5.0,),
                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        validator: (value) =>
                        value!.isEmpty
                            ? "Please enter password"
                            : null,
                        onSaved: (value) =>
                            setState(() {
                              password = value;
                            }),
                        //decoration: buildInputDecoration('Enter Password', Icons.password),
                      ),
                      SizedBox(height: 20.0,),
                      Text("Confirmed Password"),
                      SizedBox(height: 5.0,),
                      TextFormField(
                        controller: passwordController,
                        autofocus: false,
                        obscureText: true,
                        validator: (value) =>
                        value!.isEmpty
                            ? "Please enter password"
                            : null,
                        onChanged: (value) {
                          setState(() {
                            if (password == ConfirmedController) {
                              password = ConfirmedController as String?;
                            }
                          },
                            // onSaved: (value) {
                            //   _confirmpassword = value;
                            //   setState(() {
                            //     if (_password == _confirmpassword) {
                            //       _password = _confirmpassword;
                            //     }
                            //   });
                            //   //return ;
                            // },
                            // decoration: buildInputDecoration('Enter Password', Icons.password),
                          );
                        }
                      ),
                    SizedBox(height: 20),
                    Center(
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                horizontal: 60, vertical: 20),
            primary: Colors.red,
            onPrimary: Colors.teal,
          ),
          onPressed: () {
            print(email.toString());
            print(name.toString());
            print(phone.toString());
            print(password.toString());
          },
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (Context)=> Loginpage()));
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
            onTap: () {
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
                  ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
