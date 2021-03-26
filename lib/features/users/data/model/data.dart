import 'dart:convert';

class Data {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  Data({
    this.id,
    this.email,
    this.firstname,
    this.lastname,
    this.avatar,
  });

  Data copyWith({
    int id,
    String email,
    String firstname,
    String lastname,
    String avatar,
  }) {
    return Data(
      id: id ?? this.id,
      email: email ?? this.email,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'first_name': firstname,
      'last_name': lastname,
      'avatar': avatar,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      id: map['id']?.toInt(),
      email: map['email'],
      firstname: map['first_name'],
      lastname: map['last_name'],
      avatar: map['avatar'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, email: $email, first_name: $firstname, last_name: $lastname, avatar: $avatar)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Data &&
        o.id == id &&
        o.email == email &&
        o.firstname == firstname &&
        o.lastname == lastname &&
        o.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        avatar.hashCode;
  }
}
