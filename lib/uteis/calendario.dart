import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';

class CustomCalenderBuilder extends CalendarBuilder {
  @override
  Widget buildRangeDay(DateTime dateTime) {
    return Container();
  }

  @override
  Widget buildRangeDayLine(BoxConstraints constraints) {
    return SizedBox(
      child: Container(
        alignment: Alignment.center,
        color: Colors.greenAccent,
        child: const Text(
          '😀',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildRangeStartLine(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: constraints.maxWidth / 2,
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.greenAccent),
          color: Colors.greenAccent,
        ),
      ),
    );
  }

  @override
  Widget buildRangeEndLine(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: constraints.maxWidth / 2,
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.greenAccent),
          color: Colors.greenAccent,
        ),
      ),
    );
  }
}

class CustomDemoScreen extends StatelessWidget {
  const CustomDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom demo screen'),
      ),
      body: SafeArea(
        child: FlutterCalendar(
          selectionMode: CalendarSelectionMode.range,
          calendarBuilder: CustomCalenderBuilder(),
        ),
      ),
    );
  }
}
