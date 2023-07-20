import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_todo/utils/validation.dart';
import 'package:notion_todo/utils/show_flash_snack_bar.dart';
import 'package:notion_todo/components/text_field.dart';
import 'package:notion_todo/components/modal_sheet.dart';

import 'package:notion_todo/features/profile/presentation/widgets/submit_button.dart';
import 'package:notion_todo/features/profile/presentation/controllers/notion_controller.dart';
import 'package:notion_todo/features/profile/presentation/controllers/profile_controller.dart';

class NotionConfigModal extends HookConsumerWidget {
  const NotionConfigModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final profile = ref.watch(profileControllerProvider);
    final databaseIdController = useTextEditingController(
      text: profile.notionKey.databaseId,
    );
    final tokenController = useTextEditingController();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ModalSheet(
        title: 'Notion API',
        submit: SubmitButton(
          title: '설정하기',
          onPressed: () {
            // 검증에 성공하면 실행
            if (formKey.currentState!.validate()) {
              // [1] 노션 설정
              ref.read(notionControllerProvider.notifier).configNotion(
                    tokenController.text,
                    databaseIdController.text,
                  );

              // [2] 하단 시트 닫음
              Navigator.pop(context);

              // [3] 메세지 알림
              showFlashSnackBar(
                context,
                message: '설정이 완료되었습니다.',
              );
            }
          },
        ),
        child: Form(
          key: formKey,
          child: Column(children: [
            TodoTextField(
              controller: databaseIdController,
              labelText: 'DB 아이디',
              validator: validateDatabaseId,
            ),
            const SizedBox(height: 16),
            TodoTextField(
              controller: tokenController,
              labelText: '시크릿 토큰',
              validator: validateToken,
            ),
          ]),
        ),
      ),
    );
  }
}
