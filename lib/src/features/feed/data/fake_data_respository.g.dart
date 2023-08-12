// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_data_respository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedRepositoryHash() => r'45ef5f2db2ddd345c826ccdcc67c99ca39662f06';

/// See also [feedRepository].
@ProviderFor(feedRepository)
final feedRepositoryProvider = AutoDisposeProvider<FakeFeedRepository>.internal(
  feedRepository,
  name: r'feedRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FeedRepositoryRef = AutoDisposeProviderRef<FakeFeedRepository>;
String _$feedHash() => r'153038816f79afe522d4307a7f3fa6bad9f928fa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FeedRef = AutoDisposeFutureProviderRef<Feed?>;

/// See also [feed].
@ProviderFor(feed)
const feedProvider = FeedFamily();

/// See also [feed].
class FeedFamily extends Family<AsyncValue<Feed?>> {
  /// See also [feed].
  const FeedFamily();

  /// See also [feed].
  FeedProvider call(
    String section,
    String title,
  ) {
    return FeedProvider(
      section,
      title,
    );
  }

  @override
  FeedProvider getProviderOverride(
    covariant FeedProvider provider,
  ) {
    return call(
      provider.section,
      provider.title,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'feedProvider';
}

/// See also [feed].
class FeedProvider extends AutoDisposeFutureProvider<Feed?> {
  /// See also [feed].
  FeedProvider(
    this.section,
    this.title,
  ) : super.internal(
          (ref) => feed(
            ref,
            section,
            title,
          ),
          from: feedProvider,
          name: r'feedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$feedHash,
          dependencies: FeedFamily._dependencies,
          allTransitiveDependencies: FeedFamily._allTransitiveDependencies,
        );

  final String section;
  final String title;

  @override
  bool operator ==(Object other) {
    return other is FeedProvider &&
        other.section == section &&
        other.title == title;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, section.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$feedListFutureHash() => r'bfa6e0d99464a56f84ebcf73fc4c9fd01b956427';
typedef FeedListFutureRef = AutoDisposeFutureProviderRef<List<Feed>>;

/// See also [feedListFuture].
@ProviderFor(feedListFuture)
const feedListFutureProvider = FeedListFutureFamily();

/// See also [feedListFuture].
class FeedListFutureFamily extends Family<AsyncValue<List<Feed>>> {
  /// See also [feedListFuture].
  const FeedListFutureFamily();

  /// See also [feedListFuture].
  FeedListFutureProvider call(
    String section,
  ) {
    return FeedListFutureProvider(
      section,
    );
  }

  @override
  FeedListFutureProvider getProviderOverride(
    covariant FeedListFutureProvider provider,
  ) {
    return call(
      provider.section,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'feedListFutureProvider';
}

/// See also [feedListFuture].
class FeedListFutureProvider extends AutoDisposeFutureProvider<List<Feed>> {
  /// See also [feedListFuture].
  FeedListFutureProvider(
    this.section,
  ) : super.internal(
          (ref) => feedListFuture(
            ref,
            section,
          ),
          from: feedListFutureProvider,
          name: r'feedListFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedListFutureHash,
          dependencies: FeedListFutureFamily._dependencies,
          allTransitiveDependencies:
              FeedListFutureFamily._allTransitiveDependencies,
        );

  final String section;

  @override
  bool operator ==(Object other) {
    return other is FeedListFutureProvider && other.section == section;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, section.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$feedListSearchHash() => r'30534d0c384fd0b4e3e1393fdecaf0bfd714e3b7';
typedef FeedListSearchRef = AutoDisposeFutureProviderRef<List<Feed>>;

/// See also [feedListSearch].
@ProviderFor(feedListSearch)
const feedListSearchProvider = FeedListSearchFamily();

/// See also [feedListSearch].
class FeedListSearchFamily extends Family<AsyncValue<List<Feed>>> {
  /// See also [feedListSearch].
  const FeedListSearchFamily();

  /// See also [feedListSearch].
  FeedListSearchProvider call(
    String section,
    String query,
  ) {
    return FeedListSearchProvider(
      section,
      query,
    );
  }

  @override
  FeedListSearchProvider getProviderOverride(
    covariant FeedListSearchProvider provider,
  ) {
    return call(
      provider.section,
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'feedListSearchProvider';
}

/// See also [feedListSearch].
class FeedListSearchProvider extends AutoDisposeFutureProvider<List<Feed>> {
  /// See also [feedListSearch].
  FeedListSearchProvider(
    this.section,
    this.query,
  ) : super.internal(
          (ref) => feedListSearch(
            ref,
            section,
            query,
          ),
          from: feedListSearchProvider,
          name: r'feedListSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedListSearchHash,
          dependencies: FeedListSearchFamily._dependencies,
          allTransitiveDependencies:
              FeedListSearchFamily._allTransitiveDependencies,
        );

  final String section;
  final String query;

  @override
  bool operator ==(Object other) {
    return other is FeedListSearchProvider &&
        other.section == section &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, section.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
