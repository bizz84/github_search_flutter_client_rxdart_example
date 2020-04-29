// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'github_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GitHubSearchResultTearOff {
  const _$GitHubSearchResultTearOff();

  Data call(List<GitHubUser> user) {
    return Data(
      user,
    );
  }

  Error error(GitHubAPIError error) {
    return Error(
      error,
    );
  }
}

// ignore: unused_element
const $GitHubSearchResult = _$GitHubSearchResultTearOff();

mixin _$GitHubSearchResult {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<GitHubUser> user), {
    @required Result error(GitHubAPIError error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<GitHubUser> user), {
    Result error(GitHubAPIError error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data value), {
    @required Result error(Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data value), {
    Result error(Error value),
    @required Result orElse(),
  });
}

abstract class $GitHubSearchResultCopyWith<$Res> {
  factory $GitHubSearchResultCopyWith(
          GitHubSearchResult value, $Res Function(GitHubSearchResult) then) =
      _$GitHubSearchResultCopyWithImpl<$Res>;
}

class _$GitHubSearchResultCopyWithImpl<$Res>
    implements $GitHubSearchResultCopyWith<$Res> {
  _$GitHubSearchResultCopyWithImpl(this._value, this._then);

  final GitHubSearchResult _value;
  // ignore: unused_field
  final $Res Function(GitHubSearchResult) _then;
}

abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({List<GitHubUser> user});
}

class _$DataCopyWithImpl<$Res> extends _$GitHubSearchResultCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(Data(
      user == freezed ? _value.user : user as List<GitHubUser>,
    ));
  }
}

class _$Data implements Data {
  const _$Data(this.user) : assert(user != null);

  @override
  final List<GitHubUser> user;

  @override
  String toString() {
    return 'GitHubSearchResult(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<GitHubUser> user), {
    @required Result error(GitHubAPIError error),
  }) {
    assert($default != null);
    assert(error != null);
    return $default(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<GitHubUser> user), {
    Result error(GitHubAPIError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data value), {
    @required Result error(Error value),
  }) {
    assert($default != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data value), {
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Data implements GitHubSearchResult {
  const factory Data(List<GitHubUser> user) = _$Data;

  List<GitHubUser> get user;
  $DataCopyWith<Data> get copyWith;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({GitHubAPIError error});
}

class _$ErrorCopyWithImpl<$Res> extends _$GitHubSearchResultCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(Error(
      error == freezed ? _value.error : error as GitHubAPIError,
    ));
  }
}

class _$Error implements Error {
  const _$Error(this.error) : assert(error != null);

  @override
  final GitHubAPIError error;

  @override
  String toString() {
    return 'GitHubSearchResult.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<GitHubUser> user), {
    @required Result error(GitHubAPIError error),
  }) {
    assert($default != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<GitHubUser> user), {
    Result error(GitHubAPIError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data value), {
    @required Result error(Error value),
  }) {
    assert($default != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data value), {
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements GitHubSearchResult {
  const factory Error(GitHubAPIError error) = _$Error;

  GitHubAPIError get error;
  $ErrorCopyWith<Error> get copyWith;
}
