import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/router.dart';
import 'package:todo_list_sample/utility/account.dart';
import 'package:todo_list_sample/view/account/widget/input_field.dart';
import 'package:todo_list_sample/view/account/widget/main_button.dart';
import 'package:todo_list_sample/view/account/widget/or_divider.dart';
import 'package:todo_list_sample/view/account/widget/secondary_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () => _onGoBack(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reguster',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 24),
                InputField(
                  title: 'Email',
                  hintText: 'Enter your email',
                  controller: _emailController,
                ),
                const SizedBox(height: 24),
                InputField(
                  title: 'Password',
                  hintText: '**************',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                InputField(
                  title: 'Confirm Password',
                  hintText: '**************',
                  controller: _confirmPasswordController,
                  obscureText: true,
                ),
                const SizedBox(height: 36),
                MainButton(
                  onPressed: () => _onRegisterWithEmailAndPassword(context),
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                  ),
                ),
                const SizedBox(height: 12),
                const OrDivider(),
                const SizedBox(height: 24),
                SecondaryButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/google.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Register with Google',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  ),
                  onPressed: () => _onRegisterWithGoogle(context),
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/apple.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Register with Apple',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  ),
                  onPressed: () => _onRegisterWithApple(context),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                GestureDetector(
                  onTap: () => _onGoToLogin(context),
                  child: Text(
                    ' Login',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onGoBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onGoToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteMap.login);
  }

  void _onRegisterWithGoogle(BuildContext context) async {
    final result = await Account().signInWithGoogle();
    if (result && context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RouteMap.index,
        (route) => false,
      );
    }
  }

  void _onRegisterWithApple(BuildContext context) async {
    final result = await Account().signInWithApple();
    if (result && context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RouteMap.index,
        (route) => false,
      );
    }
  }

  void _onRegisterWithEmailAndPassword(BuildContext context) async {
    if (_passwordController.text != _confirmPasswordController.text) {
      return;
    }

    final result = await Account().signUpWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (result && context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RouteMap.index,
        (route) => false,
      );
    }
  }
}
