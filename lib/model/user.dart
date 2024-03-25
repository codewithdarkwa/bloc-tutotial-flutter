class User {
  String login;
  String avatarUrl;
  String bio;

  User({
    required this.login,
    required this.avatarUrl,
    required this.bio,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'avatar_url': avatarUrl,
      'bio': bio,
    };
  }
}
