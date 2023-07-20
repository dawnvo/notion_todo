import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_todo/features/profile/domain/profile_entity.dart';
import 'package:notion_todo/features/profile/data/profile_repository.dart';

abstract class ProfileUsecase {
  // 프로필 설정 가져오기
  Profile getProfile();

  // 배경 이미지 변경
  void changeBackground(String image);

  // 제목 수정
  void editTitle(String title);

  // 노션 환경 설정
  void configNotionKey(NotionKey key);
}

class ProfileService implements ProfileUsecase {
  final ProfileRepositoryPort _repository;

  ProfileService(this._repository);

  @override
  Profile getProfile() {
    return _repository.load();
  }

  @override
  void changeBackground(String image) {
    final profile = getProfile();
    final changed = profile.copyWith(image: image);

    _repository.save(changed);
  }

  @override
  void editTitle(String title) {
    final profile = getProfile();
    final edited = profile.copyWith(title: title);

    _repository.save(edited);
  }

  @override
  void configNotionKey(NotionKey notionKey) {
    final profile = getProfile();
    final updated = profile.copyWith(notionKey: notionKey);

    _repository.save(updated);
  }
}

final profileServiceProvider = Provider<ProfileUsecase>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ProfileService(repository);
});
