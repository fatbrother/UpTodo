import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list_sample/utility/user.dart';

class ImageBottomSheet extends StatelessWidget {
  const ImageBottomSheet({
    super.key,
    required this.onPictureChanged,
  });

  final void Function() onPictureChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text(
                'Take picture',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
          ),
          Divider(color: Theme.of(context).colorScheme.onPrimary),
          const SizedBox(height: 8),
          TextButton(
            onPressed: onTakePicture,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Text(
              'Take picture',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
          TextButton(
            onPressed: onImportFromGallery,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Text(
              'Import from gallery',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onTakePicture() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      await saveAvatarPath(image);
    }
  }

  Future<void> onImportFromGallery() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      await saveAvatarPath(image);
    }
  }

  Future<void> saveAvatarPath(XFile image) async {
    final String duplicateFilePath = (await getApplicationDocumentsDirectory()).path;
    final fileName = basename(image.path);
    await image.saveTo('$duplicateFilePath/$fileName');
    final user = User();
    user.headshotPath = '$duplicateFilePath/$fileName';
    onPictureChanged();
  }
}
