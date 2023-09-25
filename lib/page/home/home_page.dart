import 'dart:async';
import 'dart:convert';

import 'package:alowin_mini/data/model/product/product_model.dart';
import 'package:alowin_mini/data/model/realm/realm_model.dart';
import 'package:alowin_mini/data/service/realm_event.dart';
import 'package:alowin_mini/routes/screen_arguments.dart';
import 'package:alowin_mini/widget/action_bar/action_speech_widget.dart';
import 'package:alowin_mini/widget/blink_animation.dart';
import 'package:alowin_mini/widget/voice_control/speech_to_text_widget.dart';
import 'package:alowin_mini/widget/voice_control/text_to_speech_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/service/stream_event.dart';
import 'package:universal_html/html.dart' as html;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription dataStreaming;
  String speakSentence = "";
  String? _data;
  DataProductModel? dataProductModel;
  List<ProductItem> productModel = [];
  List<ProductPTM> productPTM = [];

  Future<void> initDataStream({Object? eventName = ''}) async {
    dataStreaming = (await StreamEvent.eventStream).listen((event) {
      if (event.enableVoice == true) {
        setState(() {
          speakSentence = event.recognizedWords;
        });
        if (event.finalResult == true) {
          handleCommand(event.recognizedWords);
        }
      }
    });
  }

  Future<void> handleCommand(String words) async {
    if (words.isEmpty) {
      return;
    }

    if (words == 'chấp nhận') {
      if (dataProductModel != null) {
        setState(() {
          productModel.add(ProductItem(
            sku: productPTM[0].sku ?? '',
            skuName: productPTM[0].skuName,
            location: productPTM[0].location,
            pickQty: productPTM[0].pickQty,
            suggestionName: productPTM[0].suggestName
          ));
          dataProductModel!.productItem!.removeAt(0);
          initProcessVoice();
        });
      }
    }
  }

  Future<void> initVoiceSpeech() async {
    await TextToSpeechWidgets.initialTextToSpeak();
    await SpeechToTextWidgets.initialize();
  }

  void _parseJson() async {
    _data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/product_data.json");
    final jsonResult = jsonDecode(_data!);
    if (kDebugMode) print(jsonResult);
    setState(() {
      dataProductModel = DataProductModel.fromJson(jsonResult);
    });
    productPTM = await RealmEvent.getAllProduct() ?? [];
    print('Data Product: ${productPTM[0].suggestName}');
    RealmEvent.syncFile();
  }

  @override
  void initState() {
    super.initState();
    initDataStream();
    initVoiceSpeech();
    initPermissionMicrophone();
    _parseJson();
  }

  Future<void> initPermissionMicrophone() async {
    await html.window.navigator.permissions?.query({"name": "microphone"});
  }

  void initProcessVoice() {
    TextToSpeechWidgets.speakText(
        '${dataProductModel?.productItem?[0].suggestionName}, tại vị trí ${dataProductModel?.productItem?[0].location}, số lượng ${dataProductModel?.productItem?[0].pickQty}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFF1F1F1F),
        extendBodyBehindAppBar: true,
        appBar: buildHeaderBar(),
        body: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/img_light_background.png',
                  fit: BoxFit.cover,
                )),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 100),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: ListView.separated(
                  itemCount: productModel.length,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        height: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                  itemBuilder: (context, index) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: index == 0
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(30))
                              : null,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${productModel[index].skuName}',
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                _itemMarkerCheckGreen()
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('SKU: ${productModel[index].sku}'),
                                Text('Vị trí: ${productModel[index].location}'),
                                Text('SL: ${productModel[index].pickQty}'),
                              ],
                            )
                          ],
                        ));
                  }),
            ),
            buildBottomInfo()
          ],
        ),
        bottomNavigationBar: buildBottomBar(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: const ActionSpeechWidget());
  }

  dynamic buildHeaderBar() {
    return AppBar(
      title: Text(
        'PTM'.toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _itemMarkerCheckGreen() {
    return Container(
        margin: EdgeInsets.only(right: 5),
        child: Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            'assets/svg/ic_check_green.svg',
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget buildBottomInfo() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: BlinkAnimation(
              data: ScreenArguments(arg1: dataProductModel ?? []),
            ),
          ),
          Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFFFFEDEE),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                speakSentence,
                style: const TextStyle(color: Color(0xFFF20A39)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )),
        ],
      ),
    );
  }

  Widget buildBottomBar() {
    return SizedBox(
      height: 60,
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        padding: EdgeInsets.zero,
        child: Container(
          color: Colors.white,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
                currentIndex: 1,
                backgroundColor: Colors.white,
                unselectedItemColor: const Color(0xFFF20A39),
                selectedItemColor: Colors.transparent,
                onTap: (index) {
                  if (index == 2) {
                    initProcessVoice();
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add,
                      color: Colors.transparent,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.transparent,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.rocket_launch,
                        color: Color(0xFFF20A39),
                      ),
                      label: 'Bắt đầu')
                ]),
          ),
        ),
      ),
    );
  }
}
