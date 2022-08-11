
import 'package:engagementwallet/src/logic/mixin/cart_mixin/cart_mixin.dart';
import 'package:engagementwallet/src/logic/models/mock_data.dart';
import 'package:engagementwallet/src/ui/app_layout/shop/add_to_cart.dart';
import 'package:engagementwallet/src/ui/app_layout/shop/order_history.dart';
import 'package:engagementwallet/src/ui/app_layout/shop/search_cart.dart';
import 'package:engagementwallet/src/ui/app_layout/shop/shop_description.dart';
import 'package:engagementwallet/src/ui/app_layout/shop/shop_items.dart';
import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/utils/navigationWidget.dart';
import 'package:engagementwallet/src/utils/sized_boxes.dart';
import 'package:engagementwallet/src/widgets/dialogs/dialogs.dart';
import 'package:engagementwallet/values/assets.dart';
import 'package:engagementwallet/values/padding.dart';
import 'package:engagementwallet/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    CartMixin cart = CartMixin.cartProvider(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SHOP', style: textStyle600Small.copyWith(fontSize: 18)),
                kVerySmallHeight,
                InkWell(
                  onTap: () => openDialog(context, const OrderHistory()),
                  child: Text(
                    'View order history',
                    style: textStyleSecondary,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => openDialog(context, const SearchCart()),
                child: const Icon(Icons.search_outlined ))
            // cart.cartList.isEmpty
            //     ? SvgPicture.asset(Assets.cart)
            //     : InkWell(
            //         onTap: () => navigate(context, const AddToCart()),
            //         child: SvgPicture.asset(Assets.inCart))
          ],
        ),
        kNormalHeight,
        SizedBox(
          height: shopData.length <= 3 ? 470 : 700,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 199,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 20),
              itemCount: shopData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                int amount = shopData[index]['amount'];
                String? title = shopData[index]['title'];
                String? description = shopData[index]['description'];
                List<String> image = shopData[index]['image'];
                String id = shopData[index]['id'];
                String? thumbNail = Assets.shop1;
                return ShopItems(
                  onTap: () => navigate(
                      context,
                      ShopDescription(
                        id: id,
                        amount: amount,
                        title: title,
                        description: description,
                        image: image,
                        thumbNail: thumbNail,
                      )),
                  amount: amount,
                  description: title,
                  image: thumbNail,
                );
              }),
        ),
      ],
    );
  }
}
