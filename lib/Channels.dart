import 'package:flutter/material.dart';

import 'Channel.dart';

class Channels extends StatefulWidget {
  List<Channel> channelList ;
  Channels({Key key, this.channelList}) : super(key: key);

  @override
  State<Channels> createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.channelList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Row(
                children: [

                  Text(widget.channelList[index].name)
                ],
              ));
        },
      ),
    );
  }
}
