import 'package:hobby_hub_ui/models/user.dart';
import 'package:hobby_hub_ui/network/user_api.dart';

class SignInViewModel {
  Future<bool> signIn(String email, password) async {
    return await UserApi().signIn(email, password);
  }
}