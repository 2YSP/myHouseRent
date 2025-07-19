
class UserInfo{

  final String avatar;
  final String gender;
  final String nickname;
  final String phone;
  final int id;

  UserInfo(this.avatar, this.gender, this.nickname, this.phone, this.id);

  factory UserInfo.fromJson(Map<String,dynamic> map) => UserInfo(
      map['avatar'] as String,
      map['gender'] as String,
      map['nickname'] as String,
      map['phone'] as String,
      map['id'] as int,
  );
}