import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_flutter_client_rxdart_example/src/models/github_search_result.dart';
import 'package:github_search_flutter_client_rxdart_example/src/models/github_user.dart';
import 'package:http/http.dart' as http;

class GitHubSearchRepository {
  const GitHubSearchRepository(this._client);
  final http.Client _client;

  Uri _searchUsernameUri(String username) => Uri(
        scheme: 'https',
        host: 'api.github.com',
        path: 'search/users',
        queryParameters: {'q': username},
      );

  Future<GitHubSearchResult> searchUser(String username) async {
    final uri = _searchUsernameUri(username);
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> items = data['items'];
      if (items.isNotEmpty) {
        final users = items.map((item) => GitHubUser.fromJson(item)).toList();
        return GitHubSearchResult(users);
      }
      return const GitHubSearchResult.error(GitHubAPIError.parseError);
    }
    if (response.statusCode == 403) {
      return const GitHubSearchResult.error(GitHubAPIError.rateLimitExceeded);
    }
    print(
        'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    return const GitHubSearchResult.error(GitHubAPIError.unknownError);
  }
}

final searchRepositoryProvider = Provider<GitHubSearchRepository>((ref) {
  return GitHubSearchRepository(http.Client());
});
