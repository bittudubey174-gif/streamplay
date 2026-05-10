import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'video_player_screen.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UnityAds.init(
    gameId: '4747474',
    testMode: true,
  );
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: StreamPlayHome()));
}

class StreamPlayHome extends StatelessWidget {
  const StreamPlayHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('StreamPlay', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.white))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search video...',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                UnityAds.showVideoAd(
                  placementId: 'RewardedVideo_Android',
                  onComplete: (placementId) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoPlayerScreen(videoId: 'dQw4w9WgXcQ'),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Watch Ad & Play'),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
