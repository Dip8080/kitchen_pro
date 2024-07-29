import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

class WiFiDirectService {
  final NearbyService nearbyService = NearbyService();
  final List<Device> devices = [];
  final List<Device> connectedDevices = [];

  Future<void> initialize() async {
    nearbyService.init(
      serviceType: "your_service_type",
      deviceName: "your_device_name",
      strategy: Strategy.P2P_CLUSTER,
      callback: (isRunning) async {
        if (isRunning) {
          nearbyService.stopBrowsingForPeers();
          nearbyService.startBrowsingForPeers();
        }
      },
    );

    nearbyService.stateChangedSubscription(callback: (devicesList) {
      devicesList.forEach((device) {
        if (device.state == SessionState.connected) {
          if (!connectedDevices.contains(device)) {
            connectedDevices.add(device);
          }
        } else if (device.state == SessionState.notConnected) {
          connectedDevices.remove(device);
        }
      });
    });

    nearbyService.dataReceivedSubscription(callback: (data) {
      // Handle incoming data
    });
  }

  Future<void> sendMessage(Message message, String recipientId) async {
    final device = connectedDevices.firstWhere((device) => device.deviceId == recipientId, orElse: () => null);
    if (device != null) {
      await nearbyService.sendMessage(
        device.deviceId,
        message.toJson().toString(),
      );
    }
  }

  Stream<Message> get messages => nearbyService.dataReceivedStream.map((data) => Message.fromJson(data));
}
