import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_app/data/model/qiita_post.dart';
import 'package:qiita_app/data/provider/dio_provider.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'posts_data_source.g.dart';

final postsDataSourceProvider = Provider<PostsDataSource>((ref) {
  return PostsDataSource(
    ref.watch(dioProvider),
  );
});

@RestApi(baseUrl: "https://qiita.com/api/v2")
abstract class PostsDataSource {
  factory PostsDataSource(Dio dio, {String baseUrl}) = _PostsDataSource;

  @GET("/tags/{tag}/items")
  Future<List<QiitaPost>> getQiitaPosts(
    @Path("tag") String tag,
    @Query("per_page") int perPage,
  );
}
