import 'package:flutter/material.dart';
import 'package:todo_list_sample/router.dart';
import 'package:todo_list_sample/views/account/widget/input_field.dart';
import 'package:todo_list_sample/views/account/widget/main_button.dart';
import 'package:todo_list_sample/views/account/widget/or_divider.dart';
import 'package:todo_list_sample/views/account/widget/secondary_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            const EdgeInsets.only(top: 60, left: 12, right: 12, bottom: 10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 48),
                InputField(
                  title: 'Email',
                  hintText: 'Enter your email',
                  controller: _emailController,
                ),
                const SizedBox(height: 24),
                InputField(
                  title: 'Password',
                  hintText: '****************',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 64),
                MainButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                  ),
                ),
                const SizedBox(height: 24),
                const OrDivider(),
                const SizedBox(height: 36),
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
                        'Login with Google',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  ),
                  onPressed: () {},
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
                        'Login with Apple',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                GestureDetector(
                  onTap: () => _onGoToRegister(context),
                  child: Text(
                    ' Register',
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

  void _onGoToRegister(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteMap.register);
  }
}
