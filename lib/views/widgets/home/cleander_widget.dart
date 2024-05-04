import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  var _focusedDay = DateTime.now();
  var _selectedDay = DateTime.now();

  bool isHoliday(DateTime day) {
    return day.weekday == DateTime.saturday || day.weekday == DateTime.friday;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: TableCalendar(
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            if (isHoliday(day)) {
              final text = DateFormat.E().format(day);

              return Center(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return null;
          },
          markerBuilder: (context, day, event) {
            if (isHoliday(day)) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(1),
                child: Container(
                  // height: 7,
                  width: 5,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                ),
              );
            }

            return Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(1),
              child: Container(
                // height: 7,
                width: 5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            );
          },
        ),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
      ),
    );
  }
}
