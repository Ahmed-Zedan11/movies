class RegisterRequest {
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String email;
  final String username;
  final String password;
  final String image;

  const RegisterRequest({
    this.firstName = "",
    this.lastName = "",
    this.age = 25,
    this.gender = "",
    required this.email,
    required this.username,
    required this.password,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'age': age,
    'gender': gender,
    'email': email,
    'username': username,
    'password': password,
    'image': image,
  };
}
