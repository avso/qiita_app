import 'package:flutter/material.dart';
import 'package:qiita_app/data/remote/stub_posts_data_source.dart';
import 'package:qiita_app/data/repository/posts_repository.dart';

import 'package:qiita_app/router_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: QiitaApp(),
      overrides: [
        // ここを差し替えることによってAPI通信を行うか、ダミーデータを取得するか変更する事ができる。
        dataSourceProvider
            .overrideWith(((ref) => ref.watch(stubPostsDataSourceProvider))),
      ],
    ),
  );
}

class QiitaApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routerConfig: goRouter,
    );
  }
}
