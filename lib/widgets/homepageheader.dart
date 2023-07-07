// import 'package:flutter/material.dart';
// import 'searchbar.dart';

// class HomePageHeader extends StatelessWidget {
//   const HomePageHeader({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Container(
//               height: size.height * 0.19,
//               decoration: const BoxDecoration(
//                   color: Color(0XFF5C519A),
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(44),
//                       bottomRight: Radius.circular(44))),
//             ),
//             Positioned(
//                 child: Container(
//               alignment: Alignment.center,
//               margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 84),
//               padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
//               height: 60,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(26),
//                   boxShadow: [
//                     BoxShadow(
//                         offset: const Offset(0, 15),
//                         blurRadius: 80,
//                         color: const Color(0XFF5C519A).withOpacity(0.4))
//                   ]),
//               child:  SearchBox(controller: ,),
//             ))
//           ],
//         ),
//       ],
//     );
//   }
// }
