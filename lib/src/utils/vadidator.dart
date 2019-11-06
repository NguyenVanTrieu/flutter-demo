class Validator{
  static bool isUserName(String userName){
//    return RegExp(r'^(0)+([0-9]{9,10})$').hasMatch(userName);
    return userName.length > 5;
  }

  static bool isPassword(String pass){
    return pass.length > 5;
  }
}