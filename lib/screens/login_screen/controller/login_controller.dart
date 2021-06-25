import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nlw_two/shared/auth/auth_controller.dart';
import 'package:nlw_two/shared/models/user_models.dart';

class LoginController {
  Future<void> googleSignIn(BuildContext context) async {
    final authController = AuthController();
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName!,
        photoUrl: response.photoUrl,
      );
      authController.setUser(context, user);
      print(response);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
