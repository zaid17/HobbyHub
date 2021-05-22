import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hobby_hub_ui/controller/pos_controller.dart';
import 'package:hobby_hub_ui/controller/user_controller.dart';
import 'package:hobby_hub_ui/models/post.dart';
import 'package:hobby_hub_ui/models/user_model.dart';
import 'package:hobby_hub_ui/screens/following_screen.dart';
import 'package:hobby_hub_ui/screens/screens.dart';
import 'package:hobby_hub_ui/widgets/widgets.dart';

class UserProfileScreen extends StatefulWidget {
  static const String id = 'user_profile_screen';
  final String username;

  const UserProfileScreen({Key key, @required this.username}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  User user;
  List<Post> posts = [];

  void _follow() async {
    setState(() {
      UserController().currentUser.following.add(widget.username);
      user.followers.add(widget.username);
    });
    await UserController().followUser(widget.username);
  }

  void _unfollow() async {
    setState(() {
      UserController().currentUser.following.remove(widget.username);
      user.followers.remove(widget.username);
    });
    await UserController().unfollowUser(widget.username);
  }

  Widget _getButton() {
    final style = ElevatedButton.styleFrom(
      primary: Theme.of(context).primaryColor,
    );
    if (UserController().currentUser.username == widget.username) {
      return ElevatedButton.icon(
        label: Text("Edit Profile"),
        style: style,
        onPressed: () {},
        icon: Icon(Icons.edit),
      );
    } else {
      bool following =
          UserController().currentUser.following.contains(widget.username);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: ElevatedButton(
                  onPressed: following ? _unfollow : _follow,
                  style: style,
                  child: following ? Text("Following") : Text("Follow"))),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: ElevatedButton(
                  style: style, onPressed: () {}, child: Text("Message"))),
        ],
      );
    }
  }

  _profileHeader() {
    print("ok");
    return ListView(children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileAvatar(
                  imageUrl: (user.imgUrl == null || user.imgUrl.isEmpty)
                      ? "https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg"
                      : user.imgUrl,
                  radius: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FollowingScreen(user: user)));
                  },
                  child: Column(
                    children: [
                      Text('Following',
                          style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(height: 2),
                      Text(
                        user.following.length.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FollowersScreen(user: user)));
                  },
                  child: Column(
                    children: [
                      Text(
                        'Followers',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        user.followers.length.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Hobbies',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 2),
                    Text(
                      user?.hobbies?.length.toString() ?? "",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: MediaQuery.of(context).size.width,
                child: _getButton()),
            if (posts.isEmpty)
              for (var post in user.posts)
                FutureBuilder(
                  initialData: posts,
                  future: PostController().getPostByPostId(post),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Post post = snapshot.data;
                      posts.add(post);
                      return PostContainer(post: post);
                    }
                    return Container(
                      height: 80,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      color: Colors.grey.withOpacity(0.5),
                      child: SpinKitThreeBounce(
                          color: Theme.of(context).primaryColor, size: 50.0),
                    );
                  },
                ),
            if (posts.isNotEmpty)
              for (var post in posts)
                PostContainer(
                  post: post,
                )
          ])
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).accentColor),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.username ?? "",
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: -1),
        ),
      ),
      body: Container(
        child: user == null
            ? FutureBuilder(
                future: UserController().getUserByUsername(widget.username),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data != null) user = snapshot.data;
                    print(user.imgUrl);

                    return _profileHeader();
                  }
                  return Center(
                    child: SpinKitCircle(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                })
            : _profileHeader(),
      ),
    );
  }
}
