import 'package:flutter/material.dart';

import 'Channel.dart';
import 'ChannelDetails.dart';


class Channels extends StatefulWidget {
  Channels({
    Key key,
  }) : super(key: key);

  @override
  State<Channels> createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels> {
  @override
  Widget build(BuildContext context) {
    List<Channel> channelList = [];
    channelList.add(Channel(name: "c1"));
    channelList.add(Channel(name: "c2"));
    channelList.add(Channel(name: "c3"));
    return Container(
      child: ListView.builder(
        itemCount: channelList.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ChannelDetails(channel: channelList[index],);
                }));
              },
              title: Row(
                children: [Text(channelList[index].name)],
              ));
        },
      ),
    );
  }
}
