import '../models/data.dart';

class LoginController {
  bool login(String username, String password) {
    if (username == account.username && password == account.password) {
      return true;
    }
    return false;
  }
}
