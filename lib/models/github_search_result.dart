import 'package:freezed_annotation/freezed_annotation.dart';
import 'github_user.dart';

part 'github_search_result.freezed.dart';

enum GitHubAPIError { rateLimitExceeded, parseError, unknownError }

@freezed
abstract class GitHubSearchResult with _$GitHubSearchResult {
  const factory GitHubSearchResult(List<GitHubUser> user) = Data;
  const factory GitHubSearchResult.error(GitHubAPIError error) = Error;
}
