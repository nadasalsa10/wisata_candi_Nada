import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_nada/providers/auth_provider.dart';
import 'package:wisata_candi_nada/providers/favorite_provider.dart';
import 'package:wisata_candi_nada/screen/sign_in_screen.dart'; // Sesuaikan folder 'screen' atau 'screens'

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final favoriteCount = context.watch<FavoriteProvider>().count;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Foto Profil
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.deepPurple,
                ),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Konten Profile berdasarkan AuthProvider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: auth.isSignedIn
                  ? Column(
                      children: [
                        ProfileInfoItem(
                          icon: Icons.person,
                          label: 'Pengguna',
                          value: auth.username,
                        ),
                        const Divider(),
                        ProfileInfoItem(
                          icon: Icons.favorite,
                          label: 'Favorit',
                          value: favoriteCount > 0 ? '$favoriteCount' : '0',
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            context.read<AuthProvider>().signOut();
                          },
                          child: const Text('Sign Out'),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const Text(
                          'Anda belum masuk',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignInScreen(),
                              ),
                            );
                          },
                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Komponen ProfileInfoItem
class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}