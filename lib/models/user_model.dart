class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  List<String>? favourites;
  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.favourites
      });

  factory UserModel.fromMap(String userId,Map<String,dynamic>? snapshot) {
    return UserModel(
        id: userId,
        firstName: snapshot!['first name'],
        lastName: snapshot['last name'],
        phoneNumber: snapshot['phone number'],
        email: snapshot['email'],
        favourites: snapshot['favourites']==null ?<String>[]: List<String>.from(snapshot['favourites'])
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first name': firstName,
      'last name': lastName,
      'phone number': phoneNumber,
      'email': email,
      'favourites':favourites
    };
  }
  bool isFavourited(id){
    if(favourites!.isNotEmpty) {
      for (var post in favourites!) {
        if (post == id) {
          return true;
        }
      }
    }return false;
  }
}
