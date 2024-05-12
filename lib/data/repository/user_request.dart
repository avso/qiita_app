import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/freezed_user.dart';

class UserRequest {
  // jsonplaceholderのapiを使用
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<FreezedUser>> getAllUser() async {
    // user情報を取得する
    http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      return <FreezedUser>[];
    }

    // 受け取ったStringのjsonレスポンスを、List形式に変換
    List userMap = jsonDecode(response.body);

    List<FreezedUser> users = [];
    userMap.forEach((user) {
      // 変換したレスポンスを、Freezedで作成したUserクラスの中に入れる
      // 入れる際には、fromJson（json形式の値を、Userクラスのプロパティへ代入）を使用する
      users.add(FreezedUser.fromJson(user));
    });

    // UserクラスのListを返却
    return users;
  }
}
