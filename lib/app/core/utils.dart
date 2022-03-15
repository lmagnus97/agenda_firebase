import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Utils{
  static bool isNullOrEmptyList(List<dynamic>? data){
    return data == null || data.isEmpty;
  }

  static String formatToTime(Timestamp timestamp) {
    return DateFormat('HH:mm').format(timestamp.toDate());
  }

  static String getFormatedDateTitle(DateTime dateTime) {
    return DateFormat("EEEE, dd 'de' MMMM", 'pt_Br').format(dateTime);
  }
}