import 'package:flutter/material.dart';
import 'package:wisata_candi_nada/models/candi.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Candi> _favoriteCandi = [];

  List<Candi> get favoriteCandi => _favoriteCandi;

  // Tambahkan getter count di bawah ini:
  int get count => _favoriteCandi.length;

  bool isFavorite(Candi candi) {
    return _favoriteCandi.any((element) => element.name == candi.name);
  }

  void toggleFavorite(Candi candi) {
    if (isFavorite(candi)) {
      _favoriteCandi.removeWhere((element) => element.name == candi.name);
    } else {
      _favoriteCandi.add(candi);
    }
    notifyListeners();
  }
}