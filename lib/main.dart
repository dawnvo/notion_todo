import 'package:flutter/material.dart' hide Action;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_todo/constants/colors.dart';

import 'package:notion_todo/features/action/presentation/screens/action_screen.dart';
import 'package:notion_todo/features/profile/presentation/screens/profile_screen.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notion Todo',
      color: CommonColors.brand,

      //theme
      theme: ThemeData(
        fontFamily: 'Pretendard',
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
        scaffoldBackgroundColor: CommonColors.background,
      ),

      //navigation
      initialRoute: '/',
      routes: {
        '/': (context) => const ActionScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
