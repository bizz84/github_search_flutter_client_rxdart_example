import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_flutter_client_rxdart_example/src/models/github_search_result.dart';
import 'package:github_search_flutter_client_rxdart_example/src/repositories/github_search_repository.dart';
import 'package:rxdart/rxdart.dart';

enum APIError { rateLimitExceeded }

class GitHubSearchService {
  GitHubSearchService({required this.searchRepository}) {
    // Implementation based on: https://youtu.be/7O1UO5rEpRc
    // ReactiveConf 2018 - Brian Egan & Filip Hracek: Practical Rx with Flutter
    _results = _searchTerms
        .debounce((_) => TimerStream(true, const Duration(milliseconds: 500)))
        .switchMap((query) async* {
      yield await searchRepository.searchUser(query);
    }); // discard previous events
  }
  final GitHubSearchRepository searchRepository;

  // Input stream (search terms)
  final _searchTerms = BehaviorSubject<String>();
  void searchUser(String username) => _searchTerms.add(username);

  // Output stream (search results)
  late Stream<GitHubSearchResult> _results;
  Stream<GitHubSearchResult> get results => _results;

  void dispose() {
    _searchTerms.close();
  }
}

final searchServiceProvider = Provider<GitHubSearchService>((ref) {
  final repository = ref.watch(searchRepositoryProvider);
  return GitHubSearchService(searchRepository: repository);
});

final searchResultsProvider =
    StreamProvider.autoDispose<GitHubSearchResult>((ref) {
  final service = ref.watch(searchServiceProvider);
  return service.results;
});
