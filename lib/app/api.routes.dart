final String baseUrl = "https://customecommerce.herokuapp.com/";

class ApiRoutes {
  //user
  static final String userData = baseUrl + "userAuth/verify";
  //auth
  static final String signUp = baseUrl + "userAuth/signup";
  static final String login = baseUrl + "userAuth/login";
  //products
  static final String getProduct = baseUrl + "item/";
  //add to cart
  static final String addtocart = baseUrl + "cartItem/add-to-cart";
  static final String getcartITem = baseUrl + "cartItem/";
  static final String deletecartItem = baseUrl + "cartItem/delete";
  //*Detail page
  static final String detailPage = baseUrl + "item/details";
  //!user info
  static final String usergetinfo = baseUrl + "info/";
  static final String userpostinfo = baseUrl + "info/add-user-info";
  static final String userputinfo = baseUrl + "info/update/";
}
