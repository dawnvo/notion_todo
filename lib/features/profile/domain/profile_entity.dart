import 'package:equatable/equatable.dart';

/// Entity
class Profile extends Equatable {
  final NotionKey notionKey;

  final String? image;

  final String? title;

  const Profile({
    this.image,
    this.title,
    final NotionKey? notionKey,
  }) : notionKey = notionKey ?? const NotionKey();

  @override
  List<Object?> get props => [
        notionKey,
        image,
        title,
      ];

  Profile copyWith({
    final NotionKey? notionKey,
    final String? image,
    final String? title,
  }) {
    return Profile(
      notionKey: notionKey ?? this.notionKey,
      image: image ?? this.image,
      title: title ?? this.title,
    );
  }
}

/// Value-Object
class NotionKey {
  final String token;

  final String databaseId;

  const NotionKey({
    final String? token,
    final String? databaseId,
  })  : token = token ?? '',
        databaseId = databaseId ?? '';
}
