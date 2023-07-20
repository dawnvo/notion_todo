import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_todo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notion_todo/features/action/domain/action_entity.dart';
import 'package:notion_todo/features/action/data/action_mapper.dart';

abstract class ActionRepositoryPort {
  List<Action> load();
  Future<void> save(List<Action> actions);
}

class ActionRepository implements ActionRepositoryPort {
  const ActionRepository(this.pref);

  static const path = 'acitons';
  final SharedPreferences pref;

  @override
  List<Action> load() {
    final str = pref.getString(path) ?? '[]';
    return ActionMapper.toDomainList(str);
  }

  @override
  Future<void> save(List<Action> actions) async {
    final data = ActionMapper.toJsonList(actions);
    await pref.setString(path, data);
  }
}

final actionRepositoryProvider = Provider<ActionRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ActionRepository(prefs);
});
