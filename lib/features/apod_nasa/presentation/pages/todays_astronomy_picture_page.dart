import 'package:cronos_challenge/features/apod_nasa/presentation/pages/astronomy_picture_selector_page.dart';
import 'package:cronos_challenge/features/apod_nasa/presentation/controller/todays_astronmy_picture_page_controller.dart';
import 'package:cronos_challenge/features/apod_nasa/presentation/widgets/card_picture_widget.dart';
import 'package:flutter/material.dart';

class TodayAstronomyPicturePage extends StatefulWidget {
  const TodayAstronomyPicturePage({super.key});

  @override
  State<TodayAstronomyPicturePage> createState() =>
      _TodayAstronomyPicturePageState();
}

class _TodayAstronomyPicturePageState extends State<TodayAstronomyPicturePage> {
  late TodaysAstronomyPicturePageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TodaysAstronomyPicturePageController();
    _controller.fetchTodayAstronomyPicture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nasa APOD'),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AstronomyPictureSelectorPage(),
              ),
            ),
            label: const Row(
              children: [
                Text('Select by range'),
                Icon(Icons.calendar_month),
              ],
            ),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _controller.state,
        builder: (context, _) {
          if (_controller.state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (_controller.state.error != null) {
            return Center(child: Text('Error: ${_controller.state.error}'));
          } else if (_controller.state.pictures != null) {
            return Column(
              children: [
                const Text(
                  'Astronomy Picture of the Day',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CardPictureWidget(picture: _controller.state.pictures!.first),
              ],
            );
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}
