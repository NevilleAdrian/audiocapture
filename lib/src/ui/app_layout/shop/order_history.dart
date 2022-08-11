import 'package:engagementwallet/src/logic/models/mock_data.dart';
import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/utils/functions.dart';
import 'package:engagementwallet/src/utils/navigationWidget.dart';
import 'package:engagementwallet/src/utils/sized_boxes.dart';
import 'package:engagementwallet/src/widgets/space_divider.dart';
import 'package:engagementwallet/values/assets.dart';
import 'package:engagementwallet/values/padding.dart';
import 'package:engagementwallet/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: defaultVHPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => popView(context),
                child: Icon(
                  Icons.cancel,
                  color: greyColor,
                ),
              ),
              Text('My Order History',
                  style: textStyleBig.copyWith(fontSize: 22)),
              SvgPicture.asset(Assets.search)
            ],
          ),
        ),
        SpaceDivider(
          height: 30,
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => SpaceDivider(
                    height: 50,
                  ),
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                final items = orderHistory[index];
                return Padding(
                  padding: defaultHPadding,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            items['address'],
                            style: textStyle600Small,
                          )),
                          kSmallWidth,
                          Text(toBeginningOfSentenceCase(items['status'])!,
                              style: textStyle600Small.copyWith(
                                  color: colorType(items['status']))),
                        ],
                      ),
                      kSmallHeight,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(items['item'], style: textStyle400Small),
                          Text('N ${items['amount']}',
                              style: textStyle400Small),
                        ],
                      ),
                      kSmallHeight,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('X${items['quantity']}',
                              style: textStyle400Small),
                        ],
                      ),
                      kSmallHeight,
                      Center(
                        child: Text(toBeginningOfSentenceCase(items['status'] == 'delivered' ? 'Reorder': 'Cancel')!,
                            style: textStyle600Small.copyWith(
                                color: colorType(items['status']))),
                      )

                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
