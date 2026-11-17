import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_nada/providers/auth_provider.dart';
import 'package:wisata_candi_nada/providers/favorite_provider.dart';
import 'package:wisata_candi_nada/screen/sign_in_screen.dart';

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
            // Header gradasi + foto profil
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.indigo.shade900,
                        Colors.deepPurple,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey.shade200,
                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 18,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),

            // Konten profile
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: auth.isSignedIn
                  ? Column(
                      children: [
                        const Divider(),
                        ProfileInfoItem(
                          icon: Icons.lock,
                          iconColor: Colors.amber,
                          label: 'Pengguna',
                          value: auth.username,
                        ),
                        const Divider(),
                        ProfileInfoItem(
                          icon: Icons.favorite,
                          iconColor: Colors.red,
                          label: 'Favorit',
                          value: '$favoriteCount',
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            context.read<AuthProvider>().signOut();
                          },
                          child: const Text(
                            'Sign Out',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
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

// Komponen baris info profile
class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 8),
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: Text(': $value', style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}