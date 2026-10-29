import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_nada/providers/favorite_provider.dart';
import 'package:wisata_candi_nada/screen/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candi Favorit'),
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, favProvider, child) {
          final favorites = favProvider.favoriteCandi;

          if (favorites.isEmpty) {
            return const Center(
              child: Text('Belum ada candi favorit'),
            );
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final candi = favorites[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      candi.imageAsset,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(candi.name),
                  subtitle: Text(candi.location),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      favProvider.toggleFavorite(candi);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(candi: candi),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}