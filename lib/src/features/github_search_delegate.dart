import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_flutter_client_rxdart_example/src/models/github_search_result.dart';
import 'package:github_search_flutter_client_rxdart_example/src/models/github_user.dart';
import 'package:github_search_flutter_client_rxdart_example/src/services/github_search_service.dart';

class GitHubSearchDelegate extends SearchDelegate<GitHubUser?> {
  GitHubSearchDelegate(this.ref);
  final WidgetRef ref;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    // search-as-you-type if enabled
    ref.read(searchServiceProvider).searchUser(query);
    return buildMatchingSuggestions(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    // always search if submitted
    ref.read(searchServiceProvider).searchUser(query);
    return buildMatchingSuggestions(context);
  }

  Widget buildMatchingSuggestions(BuildContext context) {
    final Map<GitHubAPIError, String> errorMessages = {
      GitHubAPIError.parseError: 'Error reading data from the API',
      GitHubAPIError.rateLimitExceeded: 'Rate limit exceeded',
      GitHubAPIError.unknownError: 'Unknown error',
    };
    return StreamBuilder<GitHubSearchResult>(
      stream: ref.read(searchServiceProvider).results,
      builder: (context, AsyncSnapshot<GitHubSearchResult> snapshot) {
        if (snapshot.hasData) {
          final GitHubSearchResult result = snapshot.data!;

          return result.when(
            (users) => GridView.builder(
              itemCount: users.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return GitHubUserSearchResultTile(
                  user: users[index],
                  onSelected: (value) => close(context, value),
                );
              },
            ),
            error: (error) => SearchPlaceholder(title: errorMessages[error]!),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    // then return results
    // final resultsValue = ref.watch(searchResultsProvider);
    // return resultsValue.when(
    //   data: (result) {
    //     print(result);
    //     return result.when(
    //       (users) => GridView.builder(
    //         itemCount: users.length,
    //         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //           maxCrossAxisExtent: 200,
    //           crossAxisSpacing: 10,
    //           mainAxisSpacing: 10,
    //           childAspectRatio: 0.8,
    //         ),
    //         itemBuilder: (context, index) {
    //           return GitHubUserSearchResultTile(
    //             user: users[index],
    //             onSelected: (value) => close(context, value),
    //           );
    //         },
    //       ),
    //       error: (error) => SearchPlaceholder(title: errorMessages[error]!),
    //     );
    //   },
    //   loading: () => const Center(child: CircularProgressIndicator()),
    //   error: (e, st) => Center(child: Text(e.toString())),
    // );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return query.isEmpty
        ? []
        : <Widget>[
            IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          ];
  }
}

class GitHubUserSearchResultTile extends StatelessWidget {
  const GitHubUserSearchResultTile(
      {Key? key, required this.user, required this.onSelected})
      : super(key: key);
  final GitHubUser user;
  final ValueChanged<GitHubUser> onSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () => onSelected(user),
      child: Column(
        children: [
          ClipPath(
            clipper: const ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: user.avatarUrl,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            user.login,
            style: theme.textTheme.headline6,
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}

class SearchPlaceholder extends StatelessWidget {
  const SearchPlaceholder({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Text(
        title,
        style: theme.textTheme.headline5,
        textAlign: TextAlign.center,
      ),
    );
  }
}
