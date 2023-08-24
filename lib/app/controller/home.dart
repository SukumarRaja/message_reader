import 'package:get/get.dart';
import 'package:telephony/telephony.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());

  final telephony = Telephony.instance;

  final _message = "No Data".obs;

  get message => _message.value;

  set message(value) {
    _message.value = value;
  }

  var _creditedData = <SmsMessage>[].obs;

  get creditedData => _creditedData.value;

  set creditedData(value) {
    _creditedData.value = value;
  }

  var _debitedData = <SmsMessage>[].obs;

  get debitedData => _debitedData.value;

  set debitedData(value) {
    _debitedData.value = value;
  }

  readSms() async {
    var debited = await telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
        filter: SmsFilter.where(SmsColumn.ADDRESS).equals("JM-KVBUPI"));

    var credited = await telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
        filter: SmsFilter.where(SmsColumn.ADDRESS).equals("JM-KVBANK"));

    creditedData = credited;
    debitedData = debited;
  }
}
