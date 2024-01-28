class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email});

  factory UserModel.fromMap(String userId,Map<String,dynamic>? snapshot) {
    return UserModel(
        id: userId,
        firstName: snapshot!['first name'],
        lastName: snapshot!['last name'],
        phoneNumber: snapshot!['phone number'],
        email: snapshot!['email']);
  }

  Map<String, dynamic> toMap() {
    return {
      'first name': firstName,
      'last name': lastName,
      'phone number': phoneNumber,
      'email': email
    };
  }
}
