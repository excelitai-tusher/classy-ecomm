class User {
  String name;
  String email;
  String phone;
  String type;
  String token;
  String renewalToken;

  User({required this.name, required this.email, required this.phone, required this.type, required this.token,required this.renewalToken,});
  // new create converter

factory User.fromJson(Map<String, dynamic> responseData){
  return User(
      name: responseData['name'],
      email: responseData['email'],
      phone: responseData['phone'],
      type: responseData['type'],
      token: responseData['token'],
      renewalToken: responseData['renewalToken'],
  );
}
}