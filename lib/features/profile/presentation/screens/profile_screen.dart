import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_todo/constants/text.dart';
import 'package:notion_todo/constants/colors.dart';
import 'package:notion_todo/components/text.dart';
import 'package:notion_todo/features/profile/presentation/controllers/profile_controller.dart';
import 'package:notion_todo/features/profile/presentation/screens/notion_config_modal.dart';
import 'package:notion_todo/features/profile/presentation/widgets/background_picker.dart';
import 'package:notion_todo/features/profile/presentation/widgets/title_text_field.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen();

  void showConfigBottomSheet(BuildContext context, NotionConfigModal modal) {
    showModalBottomSheet(
      context: context,
      backgroundColor: CommonColors.background,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (_) => Padding(
        // Keybord padding
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: modal,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileControllerProvider);
    final titleController = useTextEditingController();

    // * 저장된 제목이 존재하면 불러와요.
    useEffect(() {
      titleController.text = profile.title ?? '';
      return null;
    }, []);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(title: const Text("설정"), elevation: 0),
        body: Column(children: [
          BackgroundPicker(
            onChanged: (image) => ref
                .read(profileControllerProvider.notifier)
                .changeBackground(image!.path),
            image: profile.image,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title input
                TitleTextField(
                  controller: titleController,
                  hintText: kDefaultTitle,
                  onChange: (title) => ref
                      .read(profileControllerProvider.notifier)
                      .editTitle(title),
                ),
                const SizedBox(height: 24),
                //Setting button
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.transparent,
                  ),
                  onPressed: () =>
                      showConfigBottomSheet(context, const NotionConfigModal()),
                  child: const TodoText(
                    'Notion API 설정',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
