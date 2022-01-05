import 'package:ecom_login_project/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userpreference {
  Future<bool> saveUser(User user) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('userId', user.userId);
    preferences.setString('name', user.name);
    preferences.setString('email', user.email);
    preferences.setString('phone', user.phone);
    preferences.setString('type', user.type);
    preferences.setString('token', user.token);

    return preferences.commit();
  }

  Future<User> getUser({int? userId, String? name, String? phone, String? email, String? type, String? token, renewalToken}) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    int? userId = preferences.getInt("userId");
    String? name = preferences.getString("name");
    String? email = preferences.getString("email");
    String? phone = preferences.getString("phone");
    String? type = preferences.getString("type");
    String? token = preferences.getString("token");

    return getUser(
      userId: userId,
      name: name,
      email: email,
      phone: phone,
      token: token,
      renewalToken: renewalToken,
    );
    }
    void removeUser() async{
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove("userId");
      preferences.remove("name");
      preferences.remove("email");
      preferences.remove("phone");
      preferences.remove("type");
      preferences.remove("token");
    }
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
  }