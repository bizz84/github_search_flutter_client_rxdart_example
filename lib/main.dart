import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_flutter_client_rxdart_example/app/github_search_delegate.dart';
import 'package:github_search_flutter_client_rxdart_example/models/github_user.dart';
import 'package:github_search_flutter_client_rxdart_example/repositories/github_search_repository.dart';
import 'package:github_search_flutter_client_rxdart_example/services/github_search_service.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Search Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  void _showSearch(BuildContext context, WidgetRef ref) async {
    final searchRepository = ref.read(searchRepositoryProvider);
    final service = GitHubSearchService(searchRepository: searchRepository);
    final user = await showSearch<GitHubUser?>(
      context: context,
      delegate: GitHubSearchDelegate(service),
    );
    service.dispose();
    print(user);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Search'),
      ),
      body: Center(
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          child: Text(
            'Search',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          onPressed: () => _showSearch(context, ref),
        ),
      ),
    );
  }
}
