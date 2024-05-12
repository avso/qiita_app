import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_app/framework/save_local.dart';
import 'package:qiita_app/router_config.dart';

final testScreenArgs = StateProvider<String>((ref) => 'Hello world');

class Todo {
  Todo(this.description, this.isCompleted);
  final bool isCompleted;
  final String description;
}

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }
  // TODO "removeTodo" のような他のメソッドを追加する
}

class TestScreen extends StatefulHookConsumerWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<TestScreen> {
  dynamic value = '';
  late Future data;

  @override
  void initState() {
    super.initState();
    init();

    data = LocalData.load(key: 'test');
  }

  void init() async {
    ref.read(testScreenArgs);

    var args = await LocalData.load(key: 'test');
    value = args;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final String provValue = ref.watch(testScreenArgs);

    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Column(
        children: [
          FutureBuilder<dynamic>(
            future: data,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text("none");
                case ConnectionState.waiting:
                  return const Text("waiting");
                case ConnectionState.active:
                  return const Text("active");
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    // SomethingWentWrong();
                  }
                  return Text(snapshot.data!.toString());
              }
            },
          ),
          Text('args: $value'),
          Text('args2: $provValue'),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Back'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push(RouteConfig.user_page);
            },
            child: Text('User Page'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push(RouteConfig.user_page);
            },
            child: Text('Qiita Page'),
          ),
        ],
      ),
    );
  }
}
