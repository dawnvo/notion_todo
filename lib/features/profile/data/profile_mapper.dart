import 'dart:convert';
import 'package:notion_todo/features/profile/domain/profile_entity.dart';

class ProfileMapper {
  static String toJson(Profile domain) {
    return json.encode({
      "token": domain.notionKey.token,
      "database_id": domain.notionKey.databaseId,
      "image": domain.image,
      "title": domain.title,
    });
  }

  static Profile toDomain(String str) {
    final dynamic data = json.decode(str);
    return Profile(
      notionKey: NotionKey(
        token: data["token"],
        databaseId: data["database_id"],
      ),
      image: data["image"],
      title: data["title"],
    );
  }
}
