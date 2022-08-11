 import 'package:clipboard/clipboard.dart';
import 'package:engagementwallet/src/logic/models/mock_data.dart';
import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/utils/sized_boxes.dart';
import 'package:engagementwallet/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

copy(String text) {
   FlutterClipboard.copy(text)
       .then((value) =>
       Fluttertoast.showToast(
           msg: "Copied!",
           toastLength:
           Toast.LENGTH_SHORT,
           gravity:
           ToastGravity.CENTER,
           timeInSecForIosWeb: 1,
           backgroundColor:
           secondaryColor,
           textColor: whiteColor,
           fontSize: 16.0));
 }

 String toDecimalPlace(dynamic item, [int value = 0]) {
   return item.toStringAsFixed(value);
 }

 String addSeparator(String item) {
   return item.replaceAllMapped(
       RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
 }

 Color colorType(String stat) {
   if (stat == 'delivered') {
     return secondaryColor;
   } else if (stat == 'pending'){
     return darkOrangeColor;
   }
   else {
     return Colors.redAccent;
   }
 }

 void showFlush(BuildContext context, String message, [Color? color]) {
   Fluttertoast.showToast(
     msg: message,
     toastLength: Toast.LENGTH_LONG,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 1,
     backgroundColor: secondaryColor,
     textColor: Colors.white,
     fontSize: 16.0,
   );



 }

 Widget circularProgressIndicator() => CircularProgressIndicator(
   strokeWidth: 2,
   backgroundColor: Colors.white,
   valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
 );


 dateFilter(BuildContext context) {
   DatePicker.showDatePicker(context,
       showTitleActions: true, maxTime: DateTime.now(), onChanged: (date) {
         DateFormat('yyyy-MM-dd').format(date).toString();
       }, onConfirm: (date) {
         print('confirm $date');
          DateFormat('yyyy-MM-dd').format(date).toString();
       }, currentTime: DateTime.now(), locale: LocaleType.en);
 }

 void bottomSheet(BuildContext context, String type) {
   print('type: ${type}');
   showModalBottomSheet(
       context: context,
       backgroundColor: Colors.transparent,
       builder: (BuildContext context) {
         return StatefulBuilder(
           builder: (BuildContext context, StateSetter setModalState) {
             return Container(
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       InkWell(
                         onTap: () => Navigator.pop(context),
                         child: Padding(
                           padding: const EdgeInsets.only(right: 20),
                           child: Text(
                             'Close',
                             style: TextStyle(color: blackColor),
                           ),
                         ),
                       )
                     ],
                   ),
                   kVerySmallHeight,
                   Expanded(
                     child: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(8.0),
                                 topRight: Radius.circular(8.0)),
                             color: Colors.white),
                         height: 500.0,
                         child: Container(
                           padding: EdgeInsets.symmetric(vertical: 40),
                           child: ListView.separated(
                             separatorBuilder: (context, _) =>SizedBox(height: 15,),
                             itemCount: type == 'gender' ? gender.length : mockData.length,
                             itemBuilder: (context, index) => Container(
                               padding: const EdgeInsets.only(
                                   bottom: 10, left: 15),
                               child: Row(
                                 children: [
                                   Text(type == 'gender' ? gender[index]['name'] :mockData[index]['name'],
                                     style: textStyleSecondary,
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         )
                     ),
                   ),

                 ],
               ),
             );
           },
         );
       });
 }

