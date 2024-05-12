import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_app/data/model/qiita_post.dart';
import 'package:qiita_app/data/remote/posts_data_source.dart';

final postsRepositoryProvider =
    Provider((ref) => PostsRepository(ref.read(dataSourceProvider)));

final dataSourceProvider =
    Provider<PostsDataSource>((ref) => throw UnimplementedError());

class PostsRepository {
  PostsRepository(this._dataSource);

  final PostsDataSource _dataSource;

  static const defaultPostCount = 50;

  Future<Result<List<QiitaPost>>> getQiitaPosts(
    String tag,
    int defaultPostCount,
  ) {
    return _dataSource
        .getQiitaPosts(tag, defaultPostCount)
        .then((articles) => Result<List<QiitaPost>>.success(articles))
        .catchError((error) => Result<List<QiitaPost>>.failure(error));
  }
}
