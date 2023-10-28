import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/user.dart';
import 'package:todo_list_sample/view/profile/widget/change_name_dialog.dart';
import 'package:todo_list_sample/view/profile/widget/image_bottom_sheet.dart';
import 'package:todo_list_sample/view/profile/widget/setting_row.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final int _uncompletedTasksCount = User().uncompletedTasksCount;
  late final int _completedTasksCount = User().completedTasksCount;

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
            CircleAvatar(
              radius: 54,
              backgroundImage: User().headshot.image,
            ),
            const SizedBox(height: 16),
            Text(
              User().name == "" ? "User name" : User().name,
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
                        "$_uncompletedTasksCount Task${_uncompletedTasksCount > 1 ? "s" : ""} left",
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
                        "$_completedTasksCount Task${_completedTasksCount > 1 ? "s" : ""} done",
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
                  onTap: () => _onChangeAccountImage(context),
                ),
                const SizedBox(height: 8),
                SettingRow(
                  description: "Change account name",
                  icon: ImageIcon(
                    const AssetImage('assets/icons/profile/user.png'),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onTap: () => _onChangeAccountName(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onChangeAccountImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      builder: (context) => ImageBottomSheet(
        onPictureChanged: () => setState(() {}),
      ),
    );
  }

  void _onChangeAccountName(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ChangeNameDialog(
        onNameChanged: () => setState(() {
          final User user = User();
          user.name = user.name;
        }),
      ),
    );
  }
}
