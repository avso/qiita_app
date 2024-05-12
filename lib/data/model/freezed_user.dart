///////// a. パッケージをインポートし、自動生成されるファイルを記述 /////////
import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'freezed_user.freezed.dart';
part 'freezed_user.g.dart';

///////// b. コード生成するためのクラスを作成 /////////

// freezedでコード生成するために「@freezed」を記述
@freezed
class FreezedUser with _$FreezedUser {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory FreezedUser({
    required int id,
    required String username,
    required String email,
    required String phone,
    @Default(false) bool isPremium, // デフォルト値は「@Default([デフォルト値]])」の形式で指定可能
  }) = _FreezedUser;

  // json形式で受け取るためのコードを生成するために記述
  factory FreezedUser.fromJson(Map<String, dynamic> json) =>
      _$FreezedUserFromJson(json);
}
