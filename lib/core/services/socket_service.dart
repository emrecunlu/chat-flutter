import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  final StreamController<String> streamController = StreamController<String>.broadcast();
  static SocketService? _instance;
  IO.Socket? socket;

  static SocketService get instance {
    if (_instance == null) {
      _instance = SocketService._();
    }

    return _instance!;
  }

  SocketService._();

  void initialize(String path) {
    socket = IO.io(
      path,
      IO.OptionBuilder().setTransports(["websocket"]).disableAutoConnect().build(),
    );
  }

  void connect() {
    socket!.connect();
    socket!.emit("message", "emre");
  }

  void getMessages() {
    socket!.on("message", (data) => streamController.sink.add(data));
  }
}
