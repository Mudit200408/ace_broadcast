import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

AppBar customAppBar(BuildContext context, String title,
    {bool showCalendarIcon = false}) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.surface,
    surfaceTintColor: Theme.of(context).colorScheme.surface,
    elevation: 0,
    title: Padding(
      padding: const EdgeInsets.only(left: 10, top: 15),
      child: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    centerTitle: false,
    actions: [
      Visibility(
        visible: showCalendarIcon,
        child: IconButton(
          icon: Icon(
            Iconsax.calendar,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () {},
        ),
      ),
    ],
  );
}
