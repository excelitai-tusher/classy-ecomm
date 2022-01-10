import 'dart:convert';
/// message : "Login Successfull"
/// token : "166|9OFhwBjlnN2CRakmyzdrg3h5Jx8yu0royaprRsf6"
/// data : {"id":23,"name":"abirtusher","email":"user440@gmail.com","provider_id":null,"avatar":null,"phone":"01758738893","last_seen":null,"email_verified_at":null,"current_team_id":null,"profile_photo_path":null,"created_at":"2022-01-08T04:47:22.000000Z","updated_at":"2022-01-08T04:47:22.000000Z","profile_photo_url":"https://ui-avatars.com/api/?name=abirtusher&color=7F9CF5&background=EBF4FF"}

Logindata logindataFromJson(String str) => Logindata.fromJson(json.decode(str));
String logindataToJson(Logindata data) => json.encode(data.toJson());
class Logindata {
  Logindata({
      String? message, 
      String? token, 
      Data? data,
    }){
    _message = message;
    _token = token;
    _data = data;
}

  Logindata.fromJson(dynamic json) {
    _message = json['message'];
    _token = json['token'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  String? _token;
  Data? _data;

  String? get message => _message;
  String? get token => _token;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['token'] = _token;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 23
/// name : "abirtusher"
/// email : "user440@gmail.com"
/// provider_id : null
/// avatar : null
/// phone : "01758738893"
/// last_seen : null
/// email_verified_at : null
/// current_team_id : null
/// profile_photo_path : null
/// created_at : "2022-01-08T04:47:22.000000Z"
/// updated_at : "2022-01-08T04:47:22.000000Z"
/// profile_photo_url : "https://ui-avatars.com/api/?name=abirtusher&color=7F9CF5&background=EBF4FF"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? name, 
      String? email, 
      dynamic providerId, 
      dynamic avatar, 
      String? phone, 
      dynamic lastSeen, 
      dynamic emailVerifiedAt, 
      dynamic currentTeamId, 
      dynamic profilePhotoPath, 
      String? createdAt, 
      String? updatedAt, 
      String? profilePhotoUrl,}){
    _id = id;
    _name = name;
    _email = email;
    _providerId = providerId;
    _avatar = avatar;
    _phone = phone;
    _lastSeen = lastSeen;
    _emailVerifiedAt = emailVerifiedAt;
    _currentTeamId = currentTeamId;
    _profilePhotoPath = profilePhotoPath;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _profilePhotoUrl = profilePhotoUrl;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _providerId = json['provider_id'];
    _avatar = json['avatar'];
    _phone = json['phone'];
    _lastSeen = json['last_seen'];
    _emailVerifiedAt = json['email_verified_at'];
    _currentTeamId = json['current_team_id'];
    _profilePhotoPath = json['profile_photo_path'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _profilePhotoUrl = json['profile_photo_url'];
  }
  int? _id;
  String? _name;
  String? _email;
  dynamic _providerId;
  dynamic _avatar;
  String? _phone;
  dynamic _lastSeen;
  dynamic _emailVerifiedAt;
  dynamic _currentTeamId;
  dynamic _profilePhotoPath;
  String? _createdAt;
  String? _updatedAt;
  String? _profilePhotoUrl;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get providerId => _providerId;
  dynamic get avatar => _avatar;
  String? get phone => _phone;
  dynamic get lastSeen => _lastSeen;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get currentTeamId => _currentTeamId;
  dynamic get profilePhotoPath => _profilePhotoPath;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get profilePhotoUrl => _profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['provider_id'] = _providerId;
    map['avatar'] = _avatar;
    map['phone'] = _phone;
    map['last_seen'] = _lastSeen;
    map['email_verified_at'] = _emailVerifiedAt;
    map['current_team_id'] = _currentTeamId;
    map['profile_photo_path'] = _profilePhotoPath;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['profile_photo_url'] = _profilePhotoUrl;
    return map;
  }

}