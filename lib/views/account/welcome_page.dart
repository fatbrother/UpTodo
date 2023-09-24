import 'package:flutter/material.dart';
import 'package:todo_list_sample/router.dart';
import 'package:todo_list_sample/views/account/widget/main_button.dart';
import 'package:todo_list_sample/views/account/widget/secondary_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const EdgeInsets.only(top: 100, left: 24, right: 24, bottom: 48),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to UpTodo',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Please login to your account or create new account to continue',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MainButton(
                  onPressed: () => _onLogin(context),
                  child: Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                  ),
                ),
                const SizedBox(height: 24),
                SecondaryButton(
                  onPressed: () => _onRegister(context),
                  child: Text(
                    'CREATE ACCOUNT',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onGoBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onLogin(BuildContext context) {
    Navigator.of(context).pushNamed(RouteMap.login);
  }

  void _onRegister(BuildContext context) {
    Navigator.of(context).pushNamed(RouteMap.register);
  }
}
