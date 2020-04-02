

import 'package:intl/intl.dart';

String currentDate(){
  final now = new DateTime.now();
 return DateFormat('d MMMM yyyy').format(now);
}