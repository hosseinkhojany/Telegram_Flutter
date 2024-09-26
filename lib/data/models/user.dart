class UserModel {
  String? id;
  String? realName;
  String? userName;
  String? avatar;
  String? bio;
  String? pokemonHero;
  String? lastSeen;
  String? pvs;
  String? groups;

  UserModel({
    this.id,
    this.realName,
    this.userName,
    this.avatar,
    this.bio,
    this.pokemonHero,
    this.lastSeen,
    this.pvs,
    this.groups,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      realName: json['realName'],
      userName: json['username'],
      avatar: json['avatar'],
      bio: json['bio'],
      pokemonHero: json['pokemonHero'],
      lastSeen: json['lastSeen'],
      pvs: json['pvs'],
      groups: json['groups'],
    );
  }
}