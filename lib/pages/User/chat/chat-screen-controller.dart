/*import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChatScreenController extends GetxController {
  late HubConnection _hubConnection;
  final TextEditingController textController = TextEditingController();
  final RxList messages = [].obs;
  @override
  void onInit() {
    _initSignalR();
    super.onInit();
  }

  void _initSignalR() async {
    const serverUrl = "https://192.168.0.116:45455/chatHub";
    _hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
    _hubConnection.onclose.printError;
    _hubConnection.on("ReceiveMessage", _handleIncomingMessage);
    await _hubConnection.start();
  }

  void _handleIncomingMessage(List<Object?>? args) {
    final String user = args![0] as String;
    final String message = args[1] as String;
    messages.add("$user: $message");
  }

  void sendMessage(String message) async {
    textController.clear();
    await _hubConnection.invoke("SendMessage", args: ["Flutter User", message]);
  }
}
*/