// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FeedViewOptions { grid, list }

/// A state class to controlle the [FeedPage] view on clicking buttons located on different
/// Widget classes from the class with the [Feed] data
class ViewOptionState {
  ViewOptionState({
    this.viewOption = FeedViewOptions.list,
    this.value = const AsyncValue<void>.data(null),
  });

  final FeedViewOptions viewOption;
  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  // Use of Dart model class generator to generate copyWith and Equality and toString methods
  /// Ensures that the state class [ViewOptions] is immutable by using copyWith which
  /// makes a copy of the state class in case the state changes
  ViewOptionState copyWith({
    FeedViewOptions? viewOption,
    AsyncValue<void>? value,
  }) {
    return ViewOptionState(
      viewOption: viewOption ?? this.viewOption,
      value: value ?? this.value,
    );
  }

  @override
  String toString() =>
      'ViewOptionState(viewOption: $viewOption, value: $value)';

  @override
  bool operator ==(covariant ViewOptionState other) {
    if (identical(this, other)) return true;

    return other.viewOption == viewOption && other.value == value;
  }

  @override
  int get hashCode => viewOption.hashCode ^ value.hashCode;
}
