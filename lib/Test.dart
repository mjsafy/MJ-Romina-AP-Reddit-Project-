import 'package:reddit/User.dart';

import 'Post.dart';

class Test {
  static List<Post> listOfPosts() {
    return [
      Post(
        posterUser: User(
            username: 'Flash',
            ImageUrl: 'https://static-cdn.jtvnw.net/jtv_user_pictures/c2a8145e-3d99-4497-8f5a-2be00e182a21-profile_image-70x70.png'
        ),
        content: 'Flash lag hastam. ye streamer mardomi. lotfan twitch mano follow konid',
      ),
      Post(
        posterUser: User(
          username: 'Aria',
          ImageUrl: 'https://sobhesahel.com/upload/1605335986436.jpg'
        ),
        content: 'Best chess player in the world ba ekhtelaf fahesh',
      ),
      Post(
          posterUser: User(
            username: 'mahdi',
            ImageUrl: 'https://avatars.githubusercontent.com/u/93818525?v=4',
          ),
          content:
              'Hala Badan Biya Rageb Behesh Sohbat Mikonim Azizam Chon Alan Zode Bara Sohbat Kardan Rageb besh'),
      Post(
          posterUser: User(
            username: 'mahdi',
            ImageUrl: 'https://avatars.githubusercontent.com/u/93818525?v=4',
          ),
          content: 'salam flash ino be amir daeetam goftam behet bege in 4 saal'
              ' vghan behem khosh gozash ba shoma va fekr nemikardam dostimon injori'
              ' tamom she omidvaram har kari ke mikoni tosh moafagh bashi age kasio aziat'
              ' ya narahat kardam az taraf man azash ozrkhahi kon midonam shayad maskhare'
              ' benazar biado bekhandi vali alan ke daram ino minevisam daram gerye mikonam '
              'kholse ke vaghti residi on balaha mano faramosh nakoni'),
    ];
  }
}
