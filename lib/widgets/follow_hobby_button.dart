import 'package:flutter/material.dart';
import 'package:hobby_hub_ui/controller/user_controller.dart';
import 'package:hobby_hub_ui/models/models.dart';

class FollowHobbyButton extends StatefulWidget {
  final Hobby hobby;

  const FollowHobbyButton({Key key, this.hobby}) : super(key: key);

  @override
  _FollowHobbyButtonState createState() => _FollowHobbyButtonState();
}

class _FollowHobbyButtonState extends State<FollowHobbyButton> {
  @override
  Widget build(BuildContext context) {
    bool isFollowing =
        UserController().currentUser.hobbies.contains(widget.hobby.name);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: () async {
        if (isFollowing) {
          await UserController().unfollowHobby(widget.hobby.name);
          UserController().currentUser.hobbies.remove(widget.hobby.name);
          UserController().getCurrentUser();
        } else {
          await UserController().followHobby(widget.hobby.name);
          UserController().currentUser.hobbies.add(widget.hobby.name);
          UserController().getCurrentUser();
        }
        setState(() {});
      },
      child: Text(
        isFollowing ? 'FOLLOWING' : 'Follow',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
