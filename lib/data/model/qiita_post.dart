import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qiita_app/data/model/tag.dart';
import 'package:qiita_app/data/model/user.dart';

part 'qiita_post.freezed.dart';
part 'qiita_post.g.dart';

@freezed
abstract class QiitaPost with _$QiitaPost {
  factory QiitaPost({
    String? title,
    @JsonKey(name: 'likes_count') int? likesCount,
    @JsonKey(name: 'stocks_count') int? stocksCount,
    User? user,
    String? url,
    List<Tag>? tags,
  }) = _QiitaPost;

  factory QiitaPost.fromJson(Map<String, dynamic> json) =>
      _$QiitaPostFromJson(json);
}
