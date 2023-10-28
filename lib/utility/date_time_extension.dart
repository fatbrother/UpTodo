extension DateTimeExtension on DateTime {
  String toMyString() {
    final dateTime = this;
    int month = dateTime.month;
    int day = dateTime.day;
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    if (dateTime.day == DateTime.now().day) {
      return 'Today At ${hour < 10 ? '0$hour' : hour}:${minute < 10 ? '0$minute' : minute}';
    }
    return '${month < 10 ? '0$month' : month}/${day < 10 ? '0$day' : day} At ${hour < 10 ? '0$hour' : hour}:${minute < 10 ? '0$minute' : minute}';
  }

  bool get isToday {
    final dateTime = this;
    return dateTime.day == DateTime.now().day &&
        dateTime.month == DateTime.now().month &&
        dateTime.year == DateTime.now().year;
  }
}
