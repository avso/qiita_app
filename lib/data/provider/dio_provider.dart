import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>((_) {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor()); // ←を追加することによってコンソールにログが出力されます。
  return dio;
});
