import 'package:flutter/material.dart';
import 'package:github_search_flutter_client_rxdart_example/app/github_search_delegate.dart';
import 'package:github_search_flutter_client_rxdart_example/models/github_user.dart';
import 'package:github_search_flutter_client_rxdart_example/services/github_search_api_wrapper.dart';
import 'package:github_search_flutter_client_rxdart_example/services/github_search_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Search Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void _showSearch(BuildContext context) async {
    final searchService =
        GitHubSearchService(apiWrapper: GitHubSearchAPIWrapper());
    final user = await showSearch<GitHubUser>(
      context: context,
      delegate: GitHubSearchDelegate(searchService),
    );
    searchService.dispose();
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Search'),
      ),
      body: Center(
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text('Search',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white)),
          onPressed: () => _showSearch(context),
        ),
      ),
    );
  }
}
