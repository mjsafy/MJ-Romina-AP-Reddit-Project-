import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reddit/Convertor.dart';

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
    () async {
      await Socket.connect("10.0.2.2", 555).then(
        (ss) {
          ss.write("getAllChannels");
          ss.flush();
          ss.listen((response) {
            String channels = String.fromCharCodes(response);
            channelList.addAll(Convertor.getChannels(channels));
          });
        },
      );
    };

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.purple,
            Colors.black,
            Colors.black,
            Colors.purple,
          ])),
      child: ListView.builder(
        itemCount: channelList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: (index % 2 == 0) ? Colors.teal : Colors.tealAccent,
            ),
            child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ChannelDetails(
                      channel: channelList[index],
                    );
                  }));
                },
                title: Row(
                  children: [
                    Text(
                      channelList[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
