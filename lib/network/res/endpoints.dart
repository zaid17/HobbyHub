import 'package:hobby_hub_ui/controller/user_controller.dart';

class Endpoints {
  static const host = "https://hobby-hub-project.herokuapp.com";
  static Map<String, String> headers = {
    "Content-Type": "application/json",
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${UserController().getUserToken()}',
  };
  static const String userEndpoint = "/user";
  static const String signUp = "/sign-up";
  static const String signIn = "/sign-in";
  static const String authenticateClient = "/authenticate-client";
  static const String followUser = "/follow-user";
  static const String unFollowUser = "/unfollow-user";
  static const String followHobby = "/follow-hobby";
  static const String unFollowHobby = "/unfollow-hobby";

  static const String postEndPoint = "/post";
  static const String commentEndPoint = "/comment";
  static const String feed = "/feed";
  static const String likeEndPoint = "/like";

  static const String hobbyEndpoint = "/hobby";
  static const String getAllHobbies = "/all";
}
