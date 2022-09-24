import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/app_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final LoginInfo _loginInfo = LoginInfo();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginInfo>.value(
      value: _loginInfo,
      child: MaterialApp.router(
        routerConfig: AppRouter(_loginInfo).router,
        title: 'GoRouter Example',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

/// The login information.
class LoginInfo extends ChangeNotifier {
  /// The username of login.
  String get userName => _userName;
  String _userName = '';

  /// Whether a user has logged in.
  bool get loggedIn => _userName.isNotEmpty;

  /// Logs in a user.
  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  /// Logs out the current user.
  void logout() {
    _userName = '';
    notifyListeners();
  }
}
