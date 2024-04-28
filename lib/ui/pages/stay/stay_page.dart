import 'package:flutter/material.dart';
import 'package:yogi_project/ui/pages/room/room_page.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';

import '../../../data/models/payment.dart';
import '../../../data/models/room.dart';
import '../../../data/models/stay.dart';


class StayPage extends StatelessWidget {
  final Stay stayData;

  const StayPage({required this.stayData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('숙소 상세 페이지'),
      ),
      body: Padding(
        padding: EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${stayData.stayName}', style: h5()), // 숙소명
            SizedBox(
              width: 600,
              height: 200,
              child: Image.asset('assets/images/${stayData.stayImgTitle}'),
            ), // 숙소 이미지
            SizedBox(height: gap_m),
            Text('${stayData.location}', style: subtitle1()), // 위치
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomPage(),
                  ),
                );
              },
              child: Text('상세보기'),
            ),
          ],
        ),
      ),
    );
  }
}
