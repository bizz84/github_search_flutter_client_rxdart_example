# GitHub user search API: Flutter & RxDart example

Simple app using the Flutter [`SearchDelegate`](https://api.flutter.dev/flutter/material/SearchDelegate-class.html) class to show a list of users matching the input search query:

![](images/github-search-flutter-screenshot.png)

The app uses `switchMap` & `debounce` from RxDart for a good user experience, without putting too much load on the server, or compromising bandwidth and battery life on the client.

Simple architecture diagram:

![](images/github-search-diagram.png)

- `GitHubSearchAPIWrapper`: pulls the data from the GitHub REST API
- `GitHubSearchResult`: contains the API response data
- `GitHubSearchDelegate`: shows the search UI with a grid of results
- `GitHubSearchService`: holds the logic for wiring up the API wrapper with the UI

### [LICENSE: MIT](LICENSE.md)

