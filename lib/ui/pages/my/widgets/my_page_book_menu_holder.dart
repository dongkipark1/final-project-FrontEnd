import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/book/widgets/book_list.dart';

// 마이페이지의 예약메뉴
class MyPageBookMenuHolder extends StatelessWidget {
  final Stay stayData;

  MyPageBookMenuHolder({required this.stayData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile( // 예약내역 타이틀
          title: Text('예약내역', style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () {
          },
        ),
        ListTile( // 국내숙소 리스트
          title: Text('숙소'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // 국내 숙소 탭 시 BookInKoreaPage로 모든 예약 데이터 목록을 전달
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookList(domesticbookList: []), // 수정된 생성자에 전체 목록 전달
              ),
            );
          },
        ),
      ],
    );
  }
}
