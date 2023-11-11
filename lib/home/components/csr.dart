import 'package:flutter/material.dart';

import '../../res/constants.dart';

class CSR extends StatelessWidget {
  const CSR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width>1800? MediaQuery.of(context).size.height-kToolbarHeight:MediaQuery.of(context).size.height*2,
      // color: Colors.white,
    );
  }
}
