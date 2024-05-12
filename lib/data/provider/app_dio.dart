import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_dio.g.dart'; // 自動生成ファイルを定義

@riverpod // riverpod_annotationをimportして@riverpodを追加
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor());
  return dio;
}
