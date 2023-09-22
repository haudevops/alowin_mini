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

import 'dart:convert';
import 'dart:typed_data';

import 'package:alowin_mini/data/service/stream_event.dart';
import 'package:alowin_mini/utils/constants.dart';
import 'package:intl/intl.dart';

class ConvertUtil {
  static List<String> parseImagesByteToBase64(List<Uint8List> imagesbyte) {
    List<String> base64List = [];

    imagesbyte.forEach(((imagebyte) {
      String base64string = base64.encode(imagebyte);
      final fileBase64 = 'data:image/png;base64,$base64string';
      base64List.add(fileBase64);
    }));

    return base64List;
  }

  static String? parseMoney(dynamic moneyString) {
    if (moneyString == null) {
      return '0';
    }
    final format = NumberFormat("#,##0", Constants.VI_LOCALE);
    return format.format(moneyString);
  }

  static String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    }
    return price;
  }

  static String removeAscent(String str) {
    if (str.isEmpty) {
      return str;
    }
    str = str.replaceAll(RegExp(r'[aáàạảãầâấậẫẩăặằắ]'), 'a');
    str = str.replaceAll(RegExp(r'[AÁÀẠẢÃÂẦẤẬẪẨĂẶẰẮ]'), 'A');
    str = str.replaceAll(RegExp(r'[èéẹẻẽêềếệểễ]'), 'e');
    str = str.replaceAll(RegExp(r'[ÈÉẸẺẼÊẾỀỂỄỆ]'), 'E');
    str = str.replaceAll(RegExp(r'[ìíịỉĩ]'), 'i');
    str = str.replaceAll(RegExp(r'[ÌÍỊỈĨ]'), 'I');
    str = str.replaceAll(RegExp(r'[òóọỏõôồốộổỗơờớợởỡ]'), 'o');
    str = str.replaceAll(RegExp(r'[ÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠ]'), 'O');
    str = str.replaceAll(RegExp(r'[ùúụủũưừứựửữ]'), 'u');
    str = str.replaceAll(RegExp(r'[ÙÚỤỦŨƯỨỪỰỬỮ]'), 'U');
    str = str.replaceAll(RegExp(r'[ỳýỵỷỹ]'), 'y');
    str = str.replaceAll(RegExp(r'[ỲÝỴỶỸ]'), 'Y');
    str = str.replaceAll(RegExp(r'[đ]'), 'd');
    str = str.replaceAll(RegExp(r'[Đ]'), 'D');

    return str;
  }

  static String getTextStringWithoutNumber(String textString) {
    var textEdit = textString;
    if (textEdit.isEmpty) {
      return '...';
    }
    for (final numberString in Constants.listNumberString) {
      final regexNumberString = RegExp("^$numberString|\\s$numberString");
      if (textEdit.contains(regexNumberString)) {
        textEdit = textEdit.replaceAll(
            regexNumberString, Constants.parseStringToNumber[numberString]!);
      }
    }
    return textEdit.trim();
  }

  static String getNumber(String textString) {
    var textEdit = textString;
    for (final numberString in Constants.listNumberString) {
      final regexNumberString = RegExp("^$numberString|\\s$numberString");
      if (textEdit.contains(regexNumberString)) {
        textEdit = textEdit.replaceAll(
            regexNumberString, Constants.parseStringToNumber[numberString]!);
        break;
      }
    }
    return textEdit.isEmpty ? '1' : textEdit;
  }

  static String getNumberPhone(String textString) {
    final regex = RegExp(r'^[0-9]+$');
    textString = textString.replaceAll(' ', '').trim();
    if (regex.hasMatch(textString)) {
      return textString;
    }
    return '';
  }


  static String totalPayMoney(dynamic totalPrice, {int reductionMoney = 0}) {
    dynamic totalMoney = 0;
    if (totalPrice != null) {
      totalMoney = totalPrice - reductionMoney;
    }

    final format = NumberFormat("#,##0", Constants.VI_LOCALE);
    return format.format(totalMoney).toString();
  }

  static String validateTotalPayMoney(dynamic totalPrice,
      {int reductionMoney = 0}) {
    dynamic totalMoney = 0;
    if (totalPrice != null) {
      totalMoney = totalPrice - reductionMoney;
    }
    return totalMoney.toString();
  }

  static String totalDiscountsMoney(String totalPrice) {
    dynamic totalMoney = 0;
    if (totalPrice != null) {
      totalMoney = double.parse(totalPrice);
    }

    final format = NumberFormat("#,##0", Constants.VI_LOCALE);
    return format.format(totalMoney).toString();
  }


  static String getMoneyProduct(int qtyProduct, double priceProduct) {
    final format = NumberFormat("#,##0", Constants.VI_LOCALE);
    final result = qtyProduct * priceProduct;
    if (result == 1) {
      return '0';
    }
    return '${format.format(result)}đ';
  }

  static String? formatMoney(double priceProduct) {
    final format = NumberFormat("#,##0", Constants.VI_LOCALE);
    return format.format(priceProduct);
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static String parseSequenceNumber(String textNumber) {
    if (textNumber.isEmpty) {
      return "";
    }
    return textNumber.replaceAll(RegExp(r"\s+"), "");
  }

  static String? convertGender(String gender) {
    if (gender == 'M') {
      return 'Nam';
    } else if (gender == 'F') {
      return 'Nữ';
    } else {
      return '';
    }
  }

  static String convertGenderType(int gender, String membershipGender) {
    switch (gender) {
      case 1:
        return 'Nam';
      case 2:
        return 'Nữ';
      case 0:
      default:
        return membershipGender;
    }
  }

  static String convertTypeCustomer(int type) {
    switch (type) {
      case 1:
        return 'Lẻ';
        break;
      case 2:
        return 'Sỉ';
        break;
      case 3:
        return 'Horeca';
        break;
      default:
        return '';
    }
  }

  static void clearCustomerMembership() {}

  static String addSpaceInWord(String word) {
    final arrWord = [];
    for (int i = 0; i < word.length; i++) {
      arrWord.add(word[i]);
    }
    return arrWord.join(' ');
  }
}
