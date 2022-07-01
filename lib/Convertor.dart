import 'package:reddit/Post.dart';
import 'package:reddit/User.dart';

class Convertor{
  //uname:password-email
  static User getUser(String command){
    List<String> split = command.split(":");
    String uname = split.elementAt(0);
    String password = split.elementAt(1).split("-").elementAt(0);
    String email = split.elementAt(1).split("-").elementAt(1);
    return User(username: uname , password: password , email: email);
  }
}