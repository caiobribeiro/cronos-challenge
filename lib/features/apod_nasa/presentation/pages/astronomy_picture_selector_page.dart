import 'package:cronos_challenge/features/apod_nasa/presentation/controller/astronomy_picture_selector_controller.dart';
import 'package:cronos_challenge/features/apod_nasa/presentation/widgets/card_picture_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AstronomyPictureSelectorPage extends StatefulWidget {
  const AstronomyPictureSelectorPage({super.key});

  @override
  State<AstronomyPictureSelectorPage> createState() =>
      _AstronomyPictureSelectorPageState();
}

class _AstronomyPictureSelectorPageState
    extends State<AstronomyPictureSelectorPage> {
  late AstronomyPictureSelectorController _controller;
  DateTime? _startDate;
  DateTime? _endDate;
  @override
  void initState() {
    super.initState();
    _controller = AstronomyPictureSelectorController();
    _controller.fetchFromrangeAstronomyPictures(
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    );
  }

  void _fetchAstronomyPictures() {
    if (_startDate != null && _endDate != null) {
      if (_endDate!.difference(_startDate!).inDays <= 100) {
        _controller.fetchFromrangeAstronomyPictures(
            startDate: _startDate!, endDate: _endDate!);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('The date range should be within 100 days.')),
        );
      }
    }
  }

  Future<void> _selectDate({required bool isStartDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          if (_endDate != null && _startDate!.isAfter(_endDate!)) {
            _endDate = null;
          }
        } else {
          _endDate = picked;
          if (_startDate != null && _endDate!.isBefore(_startDate!)) {
            _startDate = null;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Pictures'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _selectDate(isStartDate: true),
                child: Text(_startDate == null
                    ? 'Select Start Date'
                    : 'Start: ${DateFormat('yyyy-MM-dd').format(_startDate!)}'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => _selectDate(isStartDate: false),
                child: Text(_endDate == null
                    ? 'Select End Date'
                    : 'End: ${DateFormat('yyyy-MM-dd').format(_endDate!)}'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _fetchAstronomyPictures,
            child: const Text('Confirm'),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller.state,
              builder: (context, _) {
                if (_controller.state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (_controller.state.error != null) {
                  return Center(
                      child: Text('Error: ${_controller.state.error}'));
                } else if (_controller.state.pictures != null) {
                  return ListView.builder(
                    itemCount: _controller.state.pictures!.length,
                    itemBuilder: (context, index) {
                      final picture = _controller.state.pictures![index];
                      return CardPictureWidget(picture: picture);
                    },
                  );
                }
                return const Center(child: Text('No data'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
