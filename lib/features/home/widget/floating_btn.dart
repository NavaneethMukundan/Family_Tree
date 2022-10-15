import 'package:family_tree/features/events/view/events.dart';
import 'package:family_tree/features/forms/view/forms_page.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.add_event,
      animatedIconTheme: const IconThemeData(size: 22),
      backgroundColor: kBlack,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: const Icon(
              Icons.list_alt_rounded,
              color: kWhite,
            ),
            backgroundColor: kBlack,
            onTap: () {
              RouteController.pushRoute(context, const FormPage());
            },
            label: 'Add Father ',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: kBlack),
        // FAB 2
        SpeedDialChild(
            child: const Icon(
              Icons.list_alt_rounded,
              color: kWhite,
            ),
            backgroundColor: kBlack,
            onTap: () {
              RouteController.pushRoute(context, const FormPage());
            },
            label: 'Add Mother ',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: kBlack),
        SpeedDialChild(
            child: const Icon(
              Icons.list_alt_rounded,
              color: kWhite,
            ),
            backgroundColor: kBlack,
            onTap: () {
              RouteController.pushRoute(context, const FormPage());
            },
            label: 'Add child ',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: kBlack),
        SpeedDialChild(
            child: const Icon(
              Icons.notification_add,
              color: kWhite,
            ),
            backgroundColor: kBlack,
            onTap: () {
              RouteController.pushRoute(context, const EventPage());
            },
            label: 'Events',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: kBlack),
      ],
    );
  }
}
