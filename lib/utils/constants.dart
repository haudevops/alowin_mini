/*
 * @copyright
 * Copyright (c) 2023 OVTeam
 *
 * All Rights Reserved
 *
 * Licensed under the MIT License;
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://choosealicense.com/licenses/mit/
 *
 */

import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const String loadingLottie =
      'lib/resources/assets/cyber_security.json';
  static const String fileCommands = 'commands_iot6.json';
  static const String fileProducts = 'dictionary_products.csv';

  static const int imageQuality = 90;
  static const double maxHeight = 1280;
  static const double maxWidth = 720;
  static const int imageMaxSize = 5242880;
  static const CONFIRM_CODE_COUNT_DOWN_MILLISECOND = 90;

  static const FIVE_MB = '5mb';

  static const LOGIN_USERNAME = 'loginUserName';
  static const LOGIN_PASSWORD = 'loginPassword';

  static const LOGIN_TOKEN = 'loginToken';

  static const LANGUAGE_CHANGE = 'languageChange';

  static const THEME_APP = 'themeApp';

  static const BASE_URL = "BASE_URL";
  static const VOICE_URL = "VOICE_URL";
  static const WS_URL = "WS_URL";
  static const CLOUD_URL = "CLOUD_URL";
  static const TOKEN_AUTH = "TOKEN_AUTH";
  static const WMS_URL = "WMS_URL";
  static const CLOUD_KEY = "CLOUD_KEY";
  static const MEDIA_IOT_URL = "MEDIA_IOT_URL";
  static const ENVIRONMENT = "ENVIRONMENT";
  static const MEMBERSHIP = "MEMBERSHIP";

  static const DEV_ENVIRONMENT = "DEV";
  static const PROD_ENVIRONMENT = "PROD";
  static const VERSION = "VERSION";
  static const SaleType = "1";

  static const ERROR_CODE = 1;
  static const ERROR_STATUS_CODE = -1;
  static const MESSAGE_SUCCESS = 'Ok!';

  //Define Language
  static const VIETNAMESE = 'vi';
  static const ENGLISH = 'en';
  static const VI_LOCALE = 'vi-VN';

  static const PITCH_RATE_ONE_POINT_ZERO = 1.0;
  static const SPEECH_RATE_ZERO_POINT_SEVEN = 0.6;

  static const FIRST_WORD = 'FIRST_WORD';

  static const SPEECH_TO_TEXT_STATUS_DONE = 'done';
  static const SPEECH_TO_TEXT_STATUS_NOT_LISTENING = 'notListening';
  static const SPEECH_TO_TEXT_STATUS_LISTENING = 'listening';

  static const SALE_TYPE = 'SaleOut';
  static const ONE_TOUCH = 'OneTouch';
  static const FINGERPRINT = 'Fingerprint';

  static final listWordContact = [
    'hey golden',
    'mua hàng',
    'xuất hóa đơn',
    'xóa mặt hàng',
    'thêm mặt hàng',
    'tính tiền'
  ];

  // static final orderType = <String, Color>{
  //   'New': AppColor.colorBlackGray,
  //   'Canceled': AppColor.orderStatusRed,
  //   'Cancel': AppColor.orderStatusRed,
  //   'Waiting Approve': AppColor.orderGreenLight,
  //   'Processing': AppColor.colorBtnSwitch,
  //   'Delivering': AppColor.orderStatusBlue,
  //   'Update': AppColor.orderStatusBlue,
  //   'Delivered': AppColor.orderGreenLight,
  //   'Approved': AppColor.orderGreenLight,
  //   'Done': AppColor.orderGreenLight,
  //   'Paid': AppColor.orderGreenLight
  // };
  //
  // static final orderTypeOrder = <String, Color>{
  //   'New': AppColor.backgroundWarning,
  //   'Canceled': AppColor.orderStatusRed,
  //   'Cancel': AppColor.orderStatusRed,
  //   'Waiting Approve': AppColor.orderStatusBlue,
  //   'Processing': AppColor.colorBtnSwitch,
  //   'Delivering': AppColor.orderStatusDarkBlue,
  //   'Update': AppColor.orderStatusBlue,
  //   'Delivered': AppColor.orderGreenLight,
  //   'Approved': AppColor.orderGreenLight,
  //   'Done': AppColor.orderGreenLight,
  //   'Paid': AppColor.orderGreenLight
  // };

  static final orderName = <String, String>{
    'New': 'Mới',
    'Canceled': 'Đã hủy',
    'Cancel': 'Đã hủy',
    'Waiting Approve': 'Chờ Duyệt',
    'Processing': 'Đang xử lý',
    'Delivering': 'Đang giao hàng',
    'Delivered': 'Đã giao',
    'Approved': 'Đã duyệt',
    'Done': 'Hoàn thành',
    'Update': 'Cập nhật',
    'Paid': 'Đã thanh toán',
    'Success': "Đăng ký thành công"
  };

  static final parseStringToNumber = <String, String>{
    'một': '1',
    'hai': '2',
    'ba': '3',
    'bốn': '4',
    'năm': '5',
    'sáu': '6',
    'bảy': '7',
    'tám': '8',
    'chín': '9',
    'chính': '9',
    'mười': '10'
  };

  static final listNumberString = [
    'một',
    'hai',
    'ba',
    'bốn',
    'năm',
    'sáu',
    'bảy',
    'tám',
    'chín',
    'chính',
    'mười'
  ];

  static final listNumber = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  static final listNumberStringSpace = [
    ' một',
    ' hai',
    ' ba',
    ' bốn',
    ' năm',
    ' sáu',
    ' bảy',
    ' tám',
    ' chín',
    ' chính',
    ' mười'
  ];

  static final exportBillCommands = [
    'in hóa đơn',
    'xuất hóa đơn',
    'in bill',
    'in đơn'
  ];

  static final memberWalletCommands = ['ví hội viên', 'vỹ hội viên'];

  static final removeItemCommands = ['xả hàng', 'xoa hàng', 'xóa hàng'];

  static final reduceBill = ['giảm thêm ', 'giảm'];

  static final musicWord = ['chơi nhạc', 'dừng nhạc'];

  static final commandSellExpressOrder = ['tính tiền', 'thêm hàng', 'xóa hàng'];

  static const STATUS_FAIL = 'Fail';
  static const STATUS_CANCELED = 'Canceled';


  static List<String> listTime = ['Theo năm', 'Theo tháng'];

  static List<String> listMonth = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];

  static List<String> listYear = ['2023', '2024'];

  static List<String> listHeadNumber = [
    '032',
    '033',
    '034',
    '035',
    '036',
    '037',
    '038',
    '039',
    '098',
    '097',
    '096',
    '086',
    '091',
    '094',
    '088',
    '083',
    '084',
    '085',
    '081',
    '082',
    '070',
    '079',
    '077',
    '076',
    '078',
    '089',
    '090',
    '093',
    '092',
    '052',
    '056',
    '058',
    '099',
    '059',
    '087',
  ];
}
