import 'package:flutter_bloc/flutter_bloc.dart';
import '../../products/model/products.dart';
import '../data/favorites_repository.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository _repo;

  FavoritesCubit(this._repo) : super(FavoritesState.initial());

  Future<void> load() async {
    try {
      emit(state.copyWith(status: FavoritesStatus.loading, error: null));

      final items = await _repo.getAll();
      final ids = items.map((e) => e.id).toSet();

      emit(state.copyWith(
        status: FavoritesStatus.ready,
        items: items,
        ids: ids,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FavoritesStatus.failure,
        error: e.toString(),
      ));
    }
  }

  bool isFavorite(String id) => state.ids.contains(id);

  Future<void> toggle(Product product) async {
    try {
      await _repo.toggle(product);

      final currentItems = List<Product>.from(state.items);
      final currentIds = Set<String>.from(state.ids);

      if (currentIds.contains(product.id)) {
        currentItems.removeWhere((p) => p.id == product.id);
        currentIds.remove(product.id);
      } else {
        currentItems.add(product);
        currentIds.add(product.id);
      }

      emit(state.copyWith(items: currentItems, ids: currentIds));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> removeById(String id) async {
    try {
      await _repo.remove(id);

      final currentItems = List<Product>.from(state.items)
        ..removeWhere((p) => p.id == id);
      final currentIds = Set<String>.from(state.ids)..remove(id);

      emit(state.copyWith(items: currentItems, ids: currentIds));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}