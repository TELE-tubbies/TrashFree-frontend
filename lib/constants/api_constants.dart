class Api {
  static String baseApi = "http://localhost:3500/";

  // Authentication
  static String auth = "${baseApi}api/auth/";
  static String register = "${auth}register";
  static String login = "${auth}login";

  // Events
  static String events = "${baseApi}api/events/";
  static String getEvents = "${events}getEvents";
  static String createEvent = "${events}create";
  static String deleteEvent = "${events}delete";

  // Requests
  static String request = "${baseApi}api/request/";
  static String getRequest = "${request}getRequests";
  static String postRequest = "${request}postRequest";
}
