import 'package:hobby_hub_ui/models/hobby_model.dart';
import 'package:hobby_hub_ui/models/message_model.dart';
class User {
  String _userId;
  String _username;
  String _firstName;
  String _lastName;
  String password;
  String _email;
  String _profileImage;
  String _location;
  List<String> _posts;
  List<String> _followers;
  List<String> _following;
  List<String> _hobbies;
  String _gender;
  DateTime _birthdate;

  User({String id, String name, String imgUrl});

  User.fromServer(
      this._userId,
      this._username,
      this._firstName,
      this._lastName,
      this._email,
      this._profileImage,
      this._location,
      this._posts,
      this._followers,
      this._following,
      this._hobbies,
      this._gender,
      this._birthdate);

  factory User.fromJson(Map<String, dynamic> json) {
    return User.fromServer(
      json["userId"],
      json["username"],
      json["firstName"],
      json["lastName"],
      json["email"],
      json["profileImage"],
      json["location"],
      List<String>.from(json["ownedPosts"]),
      List<String>.from(json["followers"]),
      List<String>.from(json["following"]),
      List<String>.from(json["hobbyFollowing"]),
      json["gender"],
      json["birthdate"],
    );
  }

  String get name => null;

  String get imgUrl => null;

  get id => null;

  set location(String value) {
    if (value.isNotEmpty) _location = value;
  }

  set username(String value) {
    if (value.isNotEmpty) _username = value;
  }

  set firstName(String value) {
    if (value.isNotEmpty) _firstName = value;
  }

  set lastName(String value) {
    if (value.isNotEmpty) _lastName = value;
  }

  set email(String value) {
    if (value.isNotEmpty) _email = value;
  }

  set profileImage(String value) {
    if (value.isNotEmpty) _profileImage = value;
  }

  set gender(String value) {
    if (value.isNotEmpty) _gender = value;
  }

  set birthdate(DateTime value) {
    _birthdate = value;
  }

  String get userId => _userId;

  String get username => _username;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  String get profileImage => _profileImage;

  String get location => _location;

  List<String> get ownedPosts => _posts;

  List<String> get followers => _followers;

  List<String> get following => _following;

  List<String> get hobbyFollowing => _hobbies;

  DateTime get birthdate => _birthdate;

  String get gender => _gender;
}

final User currentUser = User(
  id: "0",
  name: 'Zaid alsaid',
  imgUrl:
      'https://envato-shoebox-0.imgix.net/9b1d/d466-d514-44c5-beb3-53313e6793f2/AI11999.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=1600&s=5b8717ff159d96b36ccba0c9a8b5ada1',
);

final List<User> users = [
  User(
    name: 'Waleed nm',
    imgUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Samer',
    imgUrl: 'https://wallpaperaccess.com/full/82955.jpg',
  ),
  User(
    name: 'Abderraouf',
    imgUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  User(
    name: 'ahamd',
    imgUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  User(
    name: 'Ed Morris',
    imgUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  User(
    name: 'David Brooks',
    imgUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Jane Doe',
    imgUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Matthew Hinkle',
    imgUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  User(
    name: 'Amy Smith',
    imgUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  User(
    name: 'Ed Morris',
    imgUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  User(
    name: 'Carolyn Duncan',
    imgUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Paul Pinnock',
    imgUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  User(
      name: 'Elizabeth Wong',
      imgUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  User(
    name: 'James Lathrop',
    imgUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  User(
    name: 'Jessie Samson',
    imgUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
];

List<Message> chats = [
  Message(
    sender: users[3],
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: users[6],
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: users[1],
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: users[4],
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: users[1],
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: users[3],
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: users[3],
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: users[3],
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: users[3],
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: users[3],
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: users[3],
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
List<Hobby> hobbies = [
  Hobby(
    name: 'Soccer',
    imgUrl:
        'https://envato-shoebox-0.imgix.net/9b1d/d466-d514-44c5-beb3-53313e6793f2/AI11999.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=1600&s=5b8717ff159d96b36ccba0c9a8b5ada1',
    description:
        'The sport of soccer (called football in most of the world) is considered to be the world\'s most popular sport. In soccer there are two teams of eleven players. Soccer is played on a large grass field with a goal at each end. The object of the game is to get the soccer ball into the opposing team\'s goal. The key to soccer is that, with the exception of the goalie, players cannot touch the ball with their hands, they can only kick, knee, or head the ball to advance it or score a goal.',
  )
];
