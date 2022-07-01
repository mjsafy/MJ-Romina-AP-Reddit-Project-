class User {
  String name;
  String id;
  String username;
  String password;
  String email;
  String ImageUrl;

  User({this.username, this.password, this.email, this.ImageUrl, this.name}) {
    id = username;
  }
}
