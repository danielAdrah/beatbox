// Import necessary packages and files

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../notifiers/songs_provider.dart';
import '../../services/song_handler.dart';
import '../../components/player_deck.dart';
import '../../components/songs_list.dart';

// Define the HomeScreen class, a StatefulWidget
class SongsTab extends StatefulWidget {
  final SongHandler songHandler;

  // Constructor to receive a SongHandler instance
  const SongsTab({super.key, required this.songHandler});

  @override
  State<SongsTab> createState() => _SongsTabState();
}

// Define the state class for SongsTab
class _SongsTabState extends State<SongsTab> {
  // Create an AutoScrollController for smooth scrolling
  final AutoScrollController _autoScrollController = AutoScrollController();

  // Method to scroll to a specific index in the song list
  void _scrollTo(int index) {
    _autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
      duration: const Duration(milliseconds: 800),
    );
  }

  // Build method for the HomeScreen widget
  @override
  Widget build(BuildContext context) {
    // Annotate the UI overlay style for system UI elements
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.surface,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
      ),
      child: Consumer<SongsProvider>(
        builder: (context, songsProvider, _) {
          // Scaffold widget for the app structure
          return Scaffold(
            body: songsProvider.isLoading
                ? _buildLoadingIndicator() // Display a loading indicator while songs are loading
                : FadeInLeft(
                    curve: Curves.linearToEaseOut,
                    duration: const Duration(milliseconds: 800),
                    child: _buildSongsList(
                        songsProvider)), // Display the list of songs
          );
        },
      ),
    );
  }

  // Method to build the loading indicator widget
  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
      ),
    );
  }

  // Method to build the main songs list with a player deck
  Widget _buildSongsList(SongsProvider songsProvider) {
    return Stack(
      children: [
        // SongsList widget to display the list of songs
        SongsList(
          songHandler: widget.songHandler,
          songs: songsProvider.songs,
          autoScrollController: _autoScrollController,
        ),
        _buildPlayerDeck(), // PlayerDeck widget for music playback controls
      ],
    );
  }

  // Method to build the player deck widget
  Widget _buildPlayerDeck() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // PlayerDeck widget with controls and the ability to scroll to a specific song
        PlayerDeck(
          songHandler: widget.songHandler,
          isLast: false,
          onTap: _scrollTo,
        ),
      ],
    );
  }
}
