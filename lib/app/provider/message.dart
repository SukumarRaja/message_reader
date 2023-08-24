import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class MessageProvider extends ChangeNotifier {
  final telephony = Telephony.instance;
}
