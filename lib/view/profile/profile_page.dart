import 'package:flutter/material.dart';
import 'package:todo_list_sample/view/profile/widget/change_name_dialog.dart';
import 'package:todo_list_sample/view/profile/widget/change_password_dialog.dart';
import 'package:todo_list_sample/view/profile/widget/image_bottom_sheet.dart';
import 'package:todo_list_sample/view/profile/widget/setting_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 50,
              foregroundImage: AssetImage('assets/images/default_avatar.png'),
            ),
            const SizedBox(height: 16),
            Text(
              'User Name',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 170,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "10 Task left",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    )),
                Container(
                    width: 170,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "5 Task done",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "settings",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.5),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                SettingRow(
                  description: "Change account image",
                  icon: ImageIcon(
                    const AssetImage('assets/icons/profile/camera.png'),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onTap: () => onChangeAccountImage(context),
                ),
                const SizedBox(height: 8),
                SettingRow(
                  description: "Change account name",
                  icon: ImageIcon(
                    const AssetImage('assets/icons/profile/user.png'),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onTap: () => onChangeAccountName(context),
                ),
                const SizedBox(height: 8),
                SettingRow(
                  description: "Change account password",
                  icon: ImageIcon(
                    const AssetImage('assets/icons/profile/key.png'),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onTap: () => onChangeAccountPassword(context),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      ImageIcon(
                        const AssetImage('assets/icons/profile/logout.png'),
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Logout",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onChangeAccountImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      builder: (context) => const ImageBottomSheet(),
    );
  }

  void onChangeAccountName(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ChangeNameDialog(),
    );
  }

  void onChangeAccountPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ChangePasswordDialog(),
    );
  }
}
