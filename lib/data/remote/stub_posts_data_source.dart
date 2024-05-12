import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_app/data/model/qiita_post.dart';
import 'package:qiita_app/data/remote/posts_data_source.dart';

final stubPostsDataSourceProvider = Provider<StubPostsDataSource>((ref) {
  return StubPostsDataSource();
});

class StubPostsDataSource implements PostsDataSource {
  // dammy_data.jsonにダミーデータが入っているのでそれを非同期で取得
  @override
  Future<List<QiitaPost>> getQiitaPosts(String tag, int perPage) async {
    final content =
        json.decode(await rootBundle.loadString('assets/stub/dammy_data.json'))
            as Iterable;
    return content.map((e) => QiitaPost.fromJson(e)).toList();
  }
}
