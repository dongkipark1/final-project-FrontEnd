import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/search.dart';
import 'package:yogi_project/ui/pages/search/widgets/custom_popup_menu_button.dart';
import 'package:yogi_project/ui/pages/search/widgets/search_result_list.dart';
import 'package:yogi_project/_core/constants/size.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _selectedPersonCount = '인원';
  String? _selectedUsePrice = '희망가격';
  String? _selectedRegion = '지역'; // 추가된 지역 변수
  List<String> searchResults = [];

  DateTime? _checkInDate;
  DateTime? _checkOutDate;

  String _searchText = '';

  String _addLeadingZero(int number) {
    if (number < 10) {
      return '0$number';
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Search> searchResultList = [
      Search(
        stayImgTitle: "overseas/overseas1.png",
        stayName: "두짓타니 괌 리조트",
        stayInfo:
        "본 숙소(두짓타니 괌 리조트)는 괌에 잠시 머물거나 본격 여행을 위해 방문하는 여행객들 사이에서 인기 있는 숙소입니다. 투숙객이 즐거운 시간을 보낼 수 있도록 다양한 시설과 특전을 제공합니다. 24시간 룸서비스, Wi-Fi (무료/전 객실), 24시간 경비 서비스, 일일 청소 서비스, 24시간 프런트 데스크 등 여러 가지를 즐길 수 있습니다. 객실은 최적의 편안함을 제공할 수 있도록 설계되어 있으며, 일부 객실에서 평면 TV, 리넨, 슬리퍼, 타월, 옷장 등을 이용할 수 있습니다. 관광 후 아늑한 객실에서 휴식을 취하거나 온수 욕조, 피트니스센터, 사우나, 실외 수영장, 스파 등을 즐길 수 있습니다. 본 숙소(두짓타니 괌 리조트)를 괌 여행의 근거지로 정해 본격적인 여행을 시작해 보세요.",
        location: "1227 Pale San Vitores Road, Tumon, 투몬 베이, 괌, 괌, 96913",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: gap_l, left: gap_m, right: gap_m),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
            decoration: InputDecoration(
              hintText: '지역, 숙소를 검색하세요',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(gap_s),
              ),
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    searchResults = [];
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: gap_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_m),
          child: Row(
            children: [
              SizedBox(width: gap_xs),
              CustomPopupMenuButton(
                initialValue: _selectedRegion, // 지역 선택 초기값 설정
                items: ['서울', '부산', '대구', '인천', '광주', '대전', '울산', '경기', '강원', '경남', '제주'],
                onSelected: (String value) {
                  setState(() {
                    _selectedRegion = value;
                  });
                },
                buttonText: '$_selectedRegion',
                selectedColor: Colors.redAccent,
                itemWidth: 60,
              ),
              SizedBox(width: gap_s),
              CustomPopupMenuButton(
                initialValue: _selectedPersonCount,
                items: ['1명', '2명', '3명', '4명+'],
                onSelected: (String value) {
                  setState(() {
                    _selectedPersonCount = value;
                  });
                },
                buttonText: '$_selectedPersonCount',
                selectedColor: Colors.redAccent,
                itemWidth: 30,
              ),
              SizedBox(width: gap_s),
              CustomPopupMenuButton(
                initialValue: _selectedUsePrice,
                items: ['5만원이하', '10만원이하', '10먄원이상'],
                onSelected: (String value) {
                  setState(() {
                    _selectedUsePrice = value;
                  });
                },
                buttonText: '$_selectedUsePrice',
                selectedColor: Colors.redAccent,
                itemWidth: 70,
              ),
            ],
          ),
        ),
        SearchResultList(stays: stays, searchResultList: [],),
      ],
    );
  }
}
