import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/review.dart';

import 'ReviewWidget.dart';

class ReviewSection extends StatelessWidget {
  final List<Review> reviews;

  ReviewSection({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '리뷰',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: gap_s),
        reviews.isEmpty
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '리뷰가 없습니다',
            style: TextStyle(fontSize: 16),
          ),
        )
            : Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              final starRating = review.rating / 5.0 * 5.0;
              return GestureDetector(
                onTap: () {
                  _showReviewPopup(context, review);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildReviewUserInfo(review.userName, review.userImgTitle),
                    SizedBox(height: gap_xs),
                    ReviewWidget(
                      stars: starRating,
                      comment: review.comment,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: gap_s),
        Divider(),
        SizedBox(height: gap_s),
      ],
    );
  }

  void _showReviewPopup(BuildContext context, Review review) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('리뷰'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: ListView.builder(
              itemCount: review.replies.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              i < review.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.redAccent,
                            ),
                          SizedBox(width: 8),
                          Text('${review.rating.toStringAsFixed(1)} 점'),
                        ],
                      ),
                      SizedBox(height: gap_s),
                      SingleChildScrollView(
                        child: Text(review.comment),
                      ),
                      SizedBox(height: gap_s),
                      Divider(),
                    ],
                  );
                } else {
                  // 대댓글 표시
                  final subComment = review.replies[index - 1];
                  return Padding(
                    padding: const EdgeInsets.all(gap_s),
                    child: Row(
                      children: [
                        Icon(
                          Icons.subdirectory_arrow_right,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(subComment.comment),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReviewUserInfo(String userName, String userAvatar) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userAvatar),
        ),
        SizedBox(width: gap_s),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: subtitle1(),
            ),
            Text(
              "작성자",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
