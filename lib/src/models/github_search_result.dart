import 'package:freezed_annotation/freezed_annotation.dart';
import 'github_user.dart';

part 'github_search_result.freezed.dart';

enum GitHubAPIError { rateLimitExceeded, parseError, unknownError }

extension GitHubAPIErrorMessage on GitHubAPIError {
  String get message {
    switch (this) {
      case GitHubAPIError.rateLimitExceeded:
        return 'Rate limit exceeded';
      case GitHubAPIError.parseError:
        return 'Error reading data from the API';
      case GitHubAPIError.unknownError:
      default:
        return 'Unknown error';
    }
  }
}

@freezed
class GitHubSearchResult with _$GitHubSearchResult {
  const factory GitHubSearchResult(List<GitHubUser> user) = Data;
  const factory GitHubSearchResult.error(GitHubAPIError error) = Error;
}
