import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_app/data/model/qiita_post.dart';
import 'package:qiita_app/data/repository/posts_repository.dart';

// エラーメッセージを管理。isNotEmptyになったらViewのref.listenのコールバックが発火してダイアログ表示
final errorMessageProvider = StateProvider<String>((_) => '');
// 現在のタグを管理
final tagProvider = StateProvider<String>((_) => 'Flutter');

// autoDisposeをつけることによってこのProviderが参照されなくなったらProviderを破棄してくれます。
final postsViewModelProvider = FutureProvider.autoDispose<List<QiitaPost>>(
  (ref) async {
    final posts = await ref
        .watch(postsRepositoryProvider)
        .getQiitaPosts(ref.watch(tagProvider), 50);
// Resultクラスを作って成功時と失敗時の処理を変えています。
// Resultクラスの説明は時間がないので割愛..
    return posts.when(
      success: (value) => value,
      failure: (error) {
        ref
            .read(errorMessageProvider.notifier)
            .update((state) => state = error.response!.statusCode.toString());
        return [];
      },
    );
  },
);
