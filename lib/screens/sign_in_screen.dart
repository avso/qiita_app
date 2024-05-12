import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qiita_app/framework/save_local.dart';
import 'package:qiita_app/screens/test_screen.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

import '../qiita_repository.dart';
// import 'item_list_screen.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final QiitaRepository repository = QiitaRepository();

  late String _state;
  late StreamSubscription<Uri?> _subscription;

  @override
  void initState() {
    super.initState();

    ref.read(testScreenArgs);

    _state = _randomString(40);
    _subscription = uriLinkStream.listen((Uri? uri) {
      if (uri != null && uri.path == '/auth/callback') {
        _onAuthorizeCallbackIsCalled(uri);
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Qiita App',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Qiitaクライアントアプリ\npowered by Flutter',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: _onSignInButtonIsPressed,
                    child: Text('Qiita ログイン'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.white, fontSize: 12),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder<PackageInfo>(
                        future: PackageInfo.fromPlatform(),
                        builder: (context, snapshot) {
                          return Text('Ver. ${snapshot.data?.version ?? '-'}');
                        },
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          showLicensePage(context: context);
                        },
                        child: Text('OSS Licenses'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonIsPressed() {
    List list = [0, 1, 2];
    LocalData.save(key: 'test', value: list);

    ref.read(testScreenArgs.notifier).state = 'Backed!';

    context.push('/about');
    // launchUrl(repository.createAuthorizeUrl(_state));
  }

  void _onAuthorizeCallbackIsCalled(Uri uri) async {
    closeInAppWebView();

    final accessToken =
        await repository.createAccessTokenFromCallbackUri(uri, _state);
    await repository.saveAccessToken(accessToken);

    Navigator.of(context).pushReplacement(
      // MaterialPageRoute(builder: (_) => ItemListScreen()),
      MaterialPageRoute(builder: (_) => Placeholder()),
    );

    context.push('/about');
  }

  String _randomString(int length) {
    final chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random.secure();
    final codeUnits = List.generate(length, (index) {
      final n = rand.nextInt(chars.length);
      return chars.codeUnitAt(n);
    });
    return String.fromCharCodes(codeUnits);
  }
}
