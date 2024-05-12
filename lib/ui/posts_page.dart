import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_app/ui/posts_view_model.dart';

// StatelessWidgetをConsumerWidgetに変更
class PostsPage extends ConsumerWidget {
  const PostsPage({super.key});

  static const primaryColor = Color(0xff59bb0c);
  static const defaultTag = 'TypeScript';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetRefを追加
    final posts = ref.watch(postsViewModelProvider);
    final controller = ref.watch(textEditingControllerProvider);
// 省略
    ref.listen<String>(
      errorMessageProvider,
      ((previous, next) {
        if (next == '403') {
          errorDialog('検索できないよ😡');
        }
        if (next == '404') {
          errorDialog('投稿が見つかりません😢');
        }
      }),
    );

    return posts.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (posts) {
// データ取得時に表示するWidgetを返却
        return;
      },
    );
  }
}
