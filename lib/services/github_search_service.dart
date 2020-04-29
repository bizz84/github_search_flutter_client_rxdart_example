import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:github_search_flutter_client_rxdart_example/services/github_search_api_wrapper.dart';
import 'package:rxdart/rxdart.dart';

enum APIError { rateLimitExceeded }

class GitHubSearchService {
  GitHubSearchService({@required this.apiWrapper}) {
    // Implementation based on: https://youtu.be/7O1UO5rEpRc
    // ReactiveConf 2018 - Brian Egan & Filip Hracek: Practical Rx with Flutter
    _results = _searchTerms
        .debounce((_) => TimerStream(true, Duration(milliseconds: 250)))
        .switchMap((username) async* {
      print('searching: $username');
      yield await apiWrapper.searchUsername(username);
    }); // discard previous events
  }
  final GitHubSearchAPIWrapper apiWrapper;

  // Input stream (search terms)
  final _searchTerms = BehaviorSubject<String>();
  void searchUsername(String username) => _searchTerms.add(username);

  // Output stream (search results)
  Stream<GitHubSearchResult> _results;
  Stream<GitHubSearchResult> get results => _results;

  void dispose() {
    _searchTerms.close();
  }
}
