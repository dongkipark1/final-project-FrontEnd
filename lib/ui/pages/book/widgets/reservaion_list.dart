import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/ui/pages/book/reservation_list_page.dart';

class ReservationList extends StatelessWidget {
  final List<Reservation> domesticbookList;

  const ReservationList({Key? key, required this.domesticbookList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Reservation> domesticbookList = [
      Reservation(
        id:'1',
        roomId:'1',
        roomImgTitle: 'hotel/hotel4.png',
        roomName: '디럭스 더블 (레이크뷰)',
        stayAddress: '강원 강릉시 강문동 258-4',
        checkInDate: DateTime(2024, 5, 1, 18, 0), // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0), // 체크아웃 날짜와 시간
        price: 300000,
        reservationName: '설동훈',
        reservationTel: '010-1111-1111',
      ),
      Reservation(
        id:'3',
        roomId:'2',
        roomImgTitle: 'hotel/hotel4.png',
        roomName: '디럭스 더블 (레이크뷰)',
        stayAddress: '강원 강릉시 강문동 258-4',
        checkInDate: DateTime(2024, 5, 1, 18, 0), // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0), // 체크아웃 날짜와 시간
        price: 300000,
        reservationName: '설동훈',
        reservationTel: '010-1111-1111',
      ),
    ];
    return ReservationListPage(reservationList: domesticbookList, appBarText: '예약내역', pays: pays);
  }
}