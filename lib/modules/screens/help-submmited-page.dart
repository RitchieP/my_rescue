import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_rescue/widgets/app_bar.dart';

class HelpSubmittedPage extends StatefulWidget {
  const HelpSubmittedPage({
    super.key,
    required this.latitude,
    required this.longitude
  });

  final double longitude, latitude;

  @override
  State<HelpSubmittedPage> createState() => _HelpSubmittedPageState();
}

class _HelpSubmittedPageState extends State<HelpSubmittedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Theme.of(context).colorScheme.primary,
                ),
                height: MediaQuery.of(context).size.height * 0.7,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.latitude, widget.longitude),
                    zoom: 14.4746,
                  ),
                  zoomControlsEnabled: false,
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
              )),
          Positioned(
            bottom: 130,
            left: 0,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary),
                child: Text(
                  "Request Sent",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 38),
                  textAlign: TextAlign.center,
                )),
          ),
          Positioned(
            bottom: 50,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "Rescue teams will arrive soon! Please be patient and stay there",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
