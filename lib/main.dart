import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Unity Ads Initialization
  UnityAds.init(
    gameId: '4747474', // यहाँ अपनी Unity Game ID डालना
    testMode: true,
    onComplete: () => print('Ads Ready!'),
  );

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StreamPlayHome(),
  ));
}

class StreamPlayHome extends StatelessWidget {
  const StreamPlayHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F), // डार्क बैकग्राउंड
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('StreamPlay', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
          // यह रहा तुम्हारा बेल आइकन
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.white)),
        ],
      ),
      body: Column(
        children: [
          // यह रहा तुम्हारा सर्च बॉक्स
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search movies...',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const Spacer(),
          // एड्स टेस्ट करने के लिए बटन
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                UnityAds.showVideoAd(placementId: 'RewardedVideo_Android');
              },
              child: const Text('Watch Ad to Play Video'),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

