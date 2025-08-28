import 'package:intl/intl.dart';

class Formatters {
  static String formatDate(String? isoDate) {
    if (isoDate == null) return "-";
    try {
      final dateTime = DateTime.parse(isoDate);
      return DateFormat("dd/MM/yyyy - HH:mm").format(dateTime);
    } catch (e) {
      return isoDate;
    }
  }

  static String formatNumber(double? value) {
    if (value == null) return "-";
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    return formatter.format(value);
  }
}
