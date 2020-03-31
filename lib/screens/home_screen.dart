import 'package:corona/screens/widgets/map_with_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const LatLng _center = const LatLng(-8.0657, 111.9025);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _buildHeaderTitle((_height / 3) - 25)),
            CustomScrollView(
              slivers: <Widget>[
                _buildAppBarHelper(_height / 3),
                _buildContent(_height)
              ],
            )
          ],
        ),
      ),
    );
  }

  /// build header title
  Widget _buildHeaderTitle(double height) {
    return Container(
      color: Colors.blue,
      height: height,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Kawal Corona',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 10),
          Text('informasi tentang covid-19',
              style: TextStyle(color: Colors.white, fontSize: 14))
        ],
      ),
    );
  }

  /// build appbar view
  Widget _buildAppBarHelper(double expandedHeight) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      expandedHeight: expandedHeight - 50,
      snap: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
  }

  /// content of page
  Widget _buildContent(double heightPage) {
    return SliverList(
        delegate: SliverChildListDelegate([_buildContentHome(heightPage)]));
  }

  /// victims of corono virues and google map (indonesia)
  Widget _buildContentHome(double heightPage) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          _buildVictims(),
          SizedBox(height: 25,),
          _buildGoogleMap(heightPage),
        ],
      ),
    );
  }

  /// victims count
  Widget _buildVictims() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Data Korban Corono di Indonesia',
              style: TextStyle(
                  color: Colors.black, fontSize: 16.0, letterSpacing: 0.5)),
          SizedBox(
            height: 5,
          ),
          Text('Tanggal 31 Maret 2020',
              style: TextStyle(
                  color: Colors.grey, fontSize: 12.0, letterSpacing: 0.5)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildItemVictim(
                    title: '1.414', note: 'Positif', color: Colors.blue),
                _buildItemVictim(
                    title: '75', note: 'Sembuh', color: Colors.green),
                _buildItemVictim(
                    title: '122', note: 'Meninggal', color: Colors.red)
              ],
            ),
          )
        ],
      ),
    );
  }

  /// item of victim
  Widget _buildItemVictim({String title, String note, Color color}) {
    return Column(
      children: <Widget>[
        Text(title, style: TextStyle(color: color, fontSize: 28)),
        SizedBox(height: 5),
        Text(
          note,
          style: TextStyle(color: Colors.black, fontSize: 12),
        )
      ],
    );
  }

  /// build google map
  Widget _buildGoogleMap(double heightPage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text('Daerah terkena Corona',
              style: TextStyle(
                  color: Colors.black, fontSize: 16.0, letterSpacing: 0.5)),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text('pemetaan provinsi yang terkena corona di indonesia',
              style: TextStyle(
                  color: Colors.grey, fontSize: 12.0, letterSpacing: 0.5)),
        ),
        SizedBox(
          height: 10,
        ),
        AspectRatio(
          aspectRatio: 1 / 1.2,
          child: Container(
            width: double.infinity,
            child: GoogleMapWithMarker(center: _center),
          ),
        ),
      ],
    );
  }
}
