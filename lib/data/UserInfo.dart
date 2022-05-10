class UserInfo {
  String name;
  int age;

  UserInfo({required this.name, required this.age});

  @override
  bool operator ==(Object other) {
    if (other is! UserInfo) {
      return false;
    }
    var old = other;
    return name == old.name && age == old.age;
  }

}
