import 'package:flutter/material.dart';
import 'package:realestate_app/screens/Profile.dart';

import '../../../constants/constants.dart';
import '../../messageScreen.dart';

class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * 0.4,
            height: 60,
            decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(
                    color: darkBlue.withOpacity(0.6),
                    offset: Offset(0,10),
                    blurRadius: 10
                )]
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon((Icons.mail_rounded),color: white,),
                GestureDetector(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageScreen()));
                 },
                  child: Text(' Message',style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                )
              ],
            ),
          ),
          Container(
            width: size.width * 0.4,
            height: 60,
            decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(
                    color: darkBlue.withOpacity(0.6),
                    offset: Offset(0,10),
                    blurRadius: 10
                )]
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon((Icons.call_rounded),color: white,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                  },

                  child: Text(' Call',style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
