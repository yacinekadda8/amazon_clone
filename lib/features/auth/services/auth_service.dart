import 'package:amazon_clone/constants/global_vars.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signupUser({
    required String name,
    required String email,
    required String password,
  }) {
    try {
      User user = User(
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          id: '');
      http.post(Uri.parse('$uri/api/signup'), body: {});
    } catch (e) {}
  }
}
