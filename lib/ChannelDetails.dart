import 'package:flutter/material.dart';

import 'Channel.dart';
class ChannelDetails extends StatefulWidget {
  Channel channel;
  ChannelDetails({Key key , this.channel}) : super(key: key);

  @override
  State<ChannelDetails> createState() => _ChannelDetailsState();
}

class _ChannelDetailsState extends State<ChannelDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true,title: Text(widget.channel.name),),);
  }
}
