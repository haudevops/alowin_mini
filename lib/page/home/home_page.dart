import 'dart:async';
import 'dart:convert';

import 'package:alowin_mini/data/model/product/product_model.dart';
import 'package:alowin_mini/widget/action_bar/action_speech_widget.dart';
import 'package:alowin_mini/widget/voice_control/speech_to_text_widget.dart';
import 'package:alowin_mini/widget/voice_control/text_to_speech_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
              child: Image.asset('assets/img/img_light_background.png',
                fit: BoxFit.cover,
              )),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 100),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30)),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    TextToSpeechWidgets.speakText('Xin chào');
                  },
                  onDoubleTap: (){},
                  child: Container(
                    height: 80,
                    width: 100,
                    child: Text('Speech'),
                  ),
                )
              ],
            ),
          ),

          buildBottomInfo()
        ],
      ),
        bottomNavigationBar: buildBottomBar(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: const ActionSpeechWidget()
    );
  }

  dynamic buildHeaderBar() {
    return AppBar(
      title: Text(
        'Alo Mini'.toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget buildBottomInfo() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          Container(
            height: 150,
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
            )
          ),
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
                unselectedItemColor: Colors.transparent,
                selectedItemColor: Colors.transparent,
                onTap: (index) {},
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
                      icon: Icon(Icons.attach_money,
                          color: Colors.transparent,),
                      label: '')
                ]),
          ),
        ),
      ),
    );
  }
}
