class Registration {
  final String userId;
  final UserAttributes attributes;

  Registration({required this.userId, required this.attributes});

  Map<String, dynamic> toJson() {
    return {
      'userId' : userId,
      'attrs' : attributes.toJson(),
    };
  }
}

class UserAttributes {
  final String name;
  final String email;
  final String phone;

  UserAttributes(
      {required this.name, required this.email, required this.phone});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
