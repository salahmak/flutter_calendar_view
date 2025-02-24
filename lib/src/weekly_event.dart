import 'dart:math';

import 'package:flutter/material.dart';

import '../calendar_view.dart';
import 'constants.dart';

class WeeklyEvent<T> {
  final WeekDays weekday;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Color color;
  final String title;
  final T event;

  /// Define style of title.
  final TextStyle? titleStyle;

  WeeklyEvent({
    required this.weekday,
    required this.startTime,
    required this.endTime,
    this.color = Colors.blue,
    required this.title,
    this.titleStyle,
    required this.event,
  });

  CalendarEventData<T> toCalendarEvent() {
    int daysToAdd = weekday.index - WeekDays.monday.index;
    final date =
        CalendarConstants.fixedWeekStart.add(Duration(days: daysToAdd));

    return CalendarEventData(
      date: date,
      startTime: DateTime(
          date.year, date.month, date.day, startTime.hour, startTime.minute),
      endTime: DateTime(
          date.year, date.month, date.day, endTime.hour, endTime.minute),
      event: event,
      title: title,
      color: color,
      titleStyle: titleStyle,
      // recurrenceSettings: RecurrenceSettings(
      //   frequency: RepeatFrequency.weekly,
      //   startDate: date,
      // ),
    );
  }
}
