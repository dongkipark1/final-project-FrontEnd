import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/room.dart';

class RoomInfoWidget extends StatelessWidget {
  final Room roomData;

  const RoomInfoWidget({Key? key, required this.roomData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(roomData.roomInfo);
  }
}
