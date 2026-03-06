import '../../products/model/products.dart';

enum FavoritesStatus { initial, loading, ready, failure }

class FavoritesState {
  final FavoritesStatus status;
  final List<Product> items;
  final Set<String> ids;
  final String? error;

  const FavoritesState({
    required this.status,
    required this.items,
    required this.ids,
    required this.error,
  });

  factory FavoritesState.initial() {
    return const FavoritesState(
      status: FavoritesStatus.initial,
      items: <Product>[],
      ids: <String>{},
      error: null,
    );
  }

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<Product>? items,
    Set<String>? ids,
    String? error,
    bool clearError = false,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      items: items ?? this.items,
      ids: ids ?? this.ids,
      error: clearError ? null : (error ?? this.error),
    );
  }
}