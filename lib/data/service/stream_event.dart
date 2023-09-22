import 'dart:async';


class EventData {
  late int? actionType;

  late bool? isSafeMode;
  //Initial
  late bool? isInitialize;
  late bool? speechEnabled;
  late bool? isMatchFinalResult;

  late bool? enableVoice;
  late bool? startPrint;
  late bool? startFingerprint;

  //Speech to text
  late bool? startVoice;
  late bool? finalResult;
  late String? recognizedWords;
  late bool? isConfident;
  late bool? isDoneSpeech;

  //Member
  late bool? startRegisterMember;

  EventData({
    int? actionType,

    bool? isSafeMode,

    //Inital
    bool? isInitialize,
    bool? speechEnabled,
    bool? isMatchFinalResult,

    bool? enableVoice,
    bool? startPrint,
    bool? startFingerprint,

    //Speech to text
    bool? startVoice,
    bool? finalResult,
    String? recognizedWords,
    bool? isConfident,

    //Member
    bool? startRegisterMember,

    bool? isDoneSpeech
  }) {
    this.actionType = actionType;

    this.isSafeMode = isSafeMode;
    //Initial
    this.isInitialize = isInitialize;
    this.speechEnabled = speechEnabled;
    this.isMatchFinalResult = isMatchFinalResult;

    this.enableVoice = enableVoice;
    this.startPrint = startPrint;
    this.startFingerprint = startFingerprint;

    //Speech to text
    this.startVoice = startVoice;
    this.finalResult = finalResult;
    this.recognizedWords = recognizedWords;
    this.isConfident = isConfident;
    this.isDoneSpeech = isDoneSpeech;

    //Member
    this.startRegisterMember = startRegisterMember;
  }
}

class StreamEvent {


  static String sessionCode = '';
  static String staff = '';
  static String siteId = '';
  static String staffNo = '';
  static String siteName = '';
  static String siteAddress = '';
  static String orderNo = '';
  static String typeParagraph = '';

  static bool isDark = false;
  static bool isReadParagraph = false;
  static bool isContinuousSpeech = false;
  static bool isSpeechExpressOrder = false;
  static bool isStartToBuyItem = false;
  static bool isSpeechEnabled = false;
  static bool enableTPayPayment = false;
  static bool isActiveExpress = false;
  static bool isSellOrderExpress = false;

  static int totalNotify = 0;
  static int lockDelay = 0;

  static final StreamController _eventController =  StreamController<EventData>.broadcast();
  static final StreamController _speechController =  StreamController<bool>.broadcast();

  static Future<Stream> get eventStream async {
    return _eventController.stream.distinct();
  }

  static Future<Stream> get eventSpeechStream async {
    return _speechController.stream.distinct();
  }

  static Future<void> publish(EventData? event) async {
    _eventController.sink.add(event);
  }

  static Future<void> publishSpeech(bool? enableSpeech) async {
    StreamEvent.isSpeechEnabled = enableSpeech!;
    _speechController.add(enableSpeech);
  }

  static Future<void> dispose() async{
    await _eventController.close();
  }

  static Future<void> disposeSpeech() async{
    await _eventController.stream.drain(100);
  }


  // static void initialUserInfo() {
  //   AuthenticateModel? authenticateModel = AccountUtil.instance.getAppSetting();
  //   staff = authenticateModel!.clientInfo!.staff!;
  //   staffNo = authenticateModel.clientInfo!.staffNo!;
  //   siteId = authenticateModel.clientInfo!.siteId!;
  //   siteName = authenticateModel.clientInfo!.siteName!;
  //   enableTPayPayment = authenticateModel.clientInfo!.enableTPayPayment!;
  //   isActiveExpress = authenticateModel.clientInfo!.isActiveExpress!;
  //   lockDelay = authenticateModel.clientInfo!.lockDelay!;
  //   siteAddress = authenticateModel.clientInfo!.siteAddress!.fullAddress!;
  //   clientInfo = authenticateModel.clientInfo!;
  //   accountSetting = authenticateModel.accountSetting;
  // }

  static void resetStreamData() {
    sessionCode = '';
    orderNo = '';
    isStartToBuyItem = false;
  }
}