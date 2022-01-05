import 'package:ecom_login_project/domain/user.dart';
import 'package:flutter/cupertino.dart';


class UserProvider extends ChangeNotifier{
  User _user = User(renewalToken: '', type: '', email: '', token: '', name: '', phone: '', userId: '',);
  User get user => _user;

  void setUser (User user){
    _user = user;
    notifyListeners();
  }
}