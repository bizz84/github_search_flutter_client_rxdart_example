import 'package:flutter/foundation.dart';

// TODO: Convert to use freezed
class GitHubUser {
  GitHubUser(
      {@required this.login, @required this.avatarUrl, @required this.htmlUrl});

  final String login;
  final String avatarUrl;
  final String htmlUrl;

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    final login = json['login'];
    if (login != null) {
      final avatarUrl = json['avatar_url'];
      final htmlUrl = json['html_url'];
      return GitHubUser(
        login: login,
        avatarUrl: avatarUrl,
        htmlUrl: htmlUrl,
      );
    }
    return null;
  }

  /* Sample response data for a given user
  {
      "login": "bizz84",
      "id": 153167,
      "node_id": "MDQ6VXNlcjE1MzE2Nw==",
      "avatar_url": "https://avatars0.githubusercontent.com/u/153167?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/bizz84",
      "html_url": "https://github.com/bizz84",
      "followers_url": "https://api.github.com/users/bizz84/followers",
      "following_url": "https://api.github.com/users/bizz84/following{/other_user}",
      "gists_url": "https://api.github.com/users/bizz84/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/bizz84/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/bizz84/subscriptions",
      "organizations_url": "https://api.github.com/users/bizz84/orgs",
      "repos_url": "https://api.github.com/users/bizz84/repos",
      "events_url": "https://api.github.com/users/bizz84/events{/privacy}",
      "received_events_url": "https://api.github.com/users/bizz84/received_events",
      "type": "User",
      "site_admin": false,
      "score": 1.0
    }
    */

  @override
  String toString() => 'username: $login';
}
