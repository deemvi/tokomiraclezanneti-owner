import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'owner' && password == 'owner') {
      await UserInfo().setToken("owner");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("owner");
      isLogin = true;
    }
    return isLogin;
  }
}
