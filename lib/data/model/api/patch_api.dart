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

class Apis {
  // auth
  static const String patchLogin = '/iot/auth/v1/token';
  static const String patchAuthenticate = '/iot/auth/v1/authenticate';
  static const String patchLogout = '/iot/auth/v1/expire';

  // Command
  static const String patchCommandCreateSession =
      '/management/v2/command/create';
  static const String patchCommandUpdateSession =
      '/management/v2/command/update';
  static const String patchCommandCreateSaleOrder =
      '/management/v2/command/saleOrder/create';
  static const String patchCustomerPayment =
      '/management/v2/customer/createPayment';
  static const String patchCustomerSaleOrder =
      '/management/v2/customer/createSaleOrder';
  static const String patchCustomerPurchaseOrder =
      '/management/v3/purchase/create';
  static const String patchSpeechOrderSuggession =
      '/management/v3/order/suggession';
  static const String patchSpeechProductSuggestion =
      '/asr/v2/productSuggestion';

  // Cloud Media
  static const String patchUploadBase64ForWeb = '/file/uploadbase64V2';

  // Membership
  static const String patchCreateMember =
      '/management/v3/command/membership/create';
  static const String patchGetMember =
      '/management/v3/command/membership/getList';
  static const String patchSpeechLog = '/management/v2/speech/logs';
  static const String patchMembershipConfirm =
      '/management/v3/command/membership/createConfirm';
  static const String patchSearchMembership = '/management/v2/member/get';
  static const String patchSearchMemberships = '/management/v3/member/search';

  // Product
  static const String patchGetProductDetail = '/management/v2/product';
  static const String patchGetProductDetailList = '/management/v2/products';

  static const String patchRealmProduct = '/management/v2/realm/getProducts';

  static const String patchRealmProductUnit =
      '/management/v2/realm/getProductUnits';

  static const String patchGetInfoMembership =
      '/management/v2/customer/getCustomer';

  static const String patchRedeemQuotaHistory =
      '/management/v2/customer/redeemQuotaHistory';

  static const String patchOrderHistory = '/management/v3/purchase/getList';

  static const String patchStaffOrderHistory =
      '/management/v3/customer/orderHistory';

  static const String patchScanStaffOrderHistory =
      '/management/v2/customer/getOrderNoByScan';

  static const String staffQuotaHistory =
      '/management/v2/customer/getStatistical';

  static const String patchGetOrderDetail =
      '/management/v2/customer/orderDetail';

  static const String patchNotifyDetail = '/management/v3/purchase/getDetail';

  static const String patchGetOrderHistoryDetail =
      '/management/v3/purchase/getDetail';

  static const String patchRegisterCustomer =
      '/management/v2/customer/registerCustomer';

  static const String patchGetListParagraph =
      '/management/v3/sampledoc/getList';

  static const String patchUpdateCustomer =
      '/management/v2/customer/updateCustomer';

  static const String patchUpdateCustomerNormal =
      '/management/v2/command/membership/update';

  static const String patchTopUpQuota = '/management/v2/customer/topupQuota';

  static const String patchRedeemQuota = '/management/v2/customer/redeemQuota';

  static const String patchPayOrder = '/management/v2/customer/payOrder';

  static const String patchPayOrderFinger =
      '/management/v3/customer/payOrderFinger';

  static const String patchPayOrderOneTouch =
      '/management/v3/customer/payOrderOneTouch';

  static const String patchGetQRCode = '/management/v2/payment/getQRCode';

  static const String patchValidatePhone = '/management/v2/member/check';

  static const String patchRemoveSessionOrder =
      '/management/v2/customer/removeSaleOrder';

  static const String patchTrackingProducts =
      '/management/v2/realm/trackingProducts';

  static const String patchBillingFile = '/management/v2/billing/file';

  static const String patchCheckVersion = '/iot/auth/v1/check/version';

  //API T-pay
  static const String patchRegisterFinger =
      '/management/v3/customer/registerFinger';

  static const String patchLinkOneTouch =
      '/management/v3/customer/linkOneTouch';

  static const String patchGetInfoCustomer =
      '/management/v3/customer/getInforCustomer';

  static const String patchPayOrderStatus =
      '/management/v3/customer/payOrderStatus';

  // Purchase
  static const String patchCancelOrder = '/management/v3/purchase/cancel';

  static const String patchConfirmOrder = '/management/v3/purchase/confirm';

  static const String patchRequestApproveOrder =
      '/management/v3/purchase/requestApprove';

  // Notify
  static const String patchNotify = '/management/v3/notify/getListNotify';

  static const String patchUpdateNotify = '/management/v3/notify/update';

  // Change Password
  static const String patchChangePassword = '/iot/auth/v1/user/changePassword';

  // Get Report
  static const String patchGetListDataReport =
      '/management/v3/report/getListDataReport';
  static const String patchGetSaleOrder =
      '/management/v3/report/detail/getSaleOrder';
  static const String patchGetPurchase =
      '/management/v3/report/detail/getPurchase';
  static const String patchGetMemberShip =
      '/management/v3/report/detail/getMemberShip';

  // Add Suggest Product
  static const String patchAddKeyword =
      '/asr/v1/addSuggestionName';

  // Get List Order
  static const String patchGetListOrder = '/management/v3/request/getList';
  // Get Detail Order
  static const String patchGetDetailOrder = '/management/v3/request/getDetail';
}
