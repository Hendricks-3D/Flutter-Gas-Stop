import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:gas_stop/Models/driver.dart';

//import 'package:adobe_xd/adobe_xd.dart';

class SignupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Navigator routes setup
      /*routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new TestPage(),
        '/signup': (BuildContext context) => new SignupPage(),
      },*/
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late Driver driver = new Driver();
  var token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: -8.3, end: -8.3),
            Pin(start: -5.2, end: -9.5),
            child: SvgPicture.string(
              _svg_ey8jsz,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 102.0, start: 31.0),
            Pin(size: 52.0, middle: 0.3169),
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 37,
                color: const Color(0xff0c2233),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 33.5, end: 33.5),
            Pin(size: 35.5, middle: 0.5867),
            child:
                // Adobe XD layer: 'Password' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    _svg_wc57a9,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, start: 47.0),
                  Pin(size: 21.0, middle: 0.6207),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      letterSpacing: 1.0799999999999998,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 23.1, start: 6.5),
                  Pin(size: 30.0, start: 0.0),
                  child:
                      // Adobe XD layer: 'Icon ionic-ios-lock' (shape)
                      SvgPicture.string(
                    _svg_bdy6hj,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 92.0, middle: 0.5149),
            Pin(size: 17.0, middle: 0.4532),
            child: Text(
              'Or, Sign in with…',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: const Color(0xfeffffff),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 197.0, middle: 0.5065),
            Pin(size: 17.0, end: 69.0),
            child: Text(
              'Already have an account? Login',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: const Color(0xb1ffc045),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 33.5, end: 33.5),
            Pin(size: 30.7, middle: 0.5024),
            child:
                // Adobe XD layer: 'Password' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    _svg_wc57a9,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 51.0, start: 48.0),
                  Pin(start: 2.5, end: 4.3),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      color: const Color(0xffffffff),
                      letterSpacing: 1.224,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 24.0, start: 5.8),
                  Pin(start: 0.0, end: 4.3),
                  child:
                      // Adobe XD layer: 'Icon simple-email' (shape)
                      SvgPicture.string(
                    _svg_qz6e9b,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 84.0, middle: 0.218),
            Pin(size: 75.0, middle: 0.3807),
            child:
                // Adobe XD layer: 'Google' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffffc045)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 5.0, end: 4.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'google_PNG19635' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('google.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 84.0, middle: 0.7733),
            Pin(size: 74.0, middle: 0.3815),
            child:
                // Adobe XD layer: 'Google' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffffc045)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 14.0, end: 13.0),
                  Pin(start: 9.0, end: 8.0),
                  child:
                      // Adobe XD layer: 'favpng_facebook-icon' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('facebook.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 116.0, start: 31.0),
            Pin(size: 43.0, middle: 0.2763),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                color: const Color(0xffffc045),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: -12.0, end: -13.0),
            Pin(size: 178.0, start: 34.0),
            child:
                // Adobe XD layer: 'Asset 4' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('car.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 33.5, end: 33.5),
            Pin(size: 35.5, middle: 0.6738),
            child:
                // Adobe XD layer: 'Password' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    _svg_wc57a9,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 153.0, start: 47.0),
                  Pin(size: 21.0, middle: 0.6207),
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      letterSpacing: 1.0799999999999998,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 23.1, start: 6.5),
                  Pin(size: 30.0, start: 0.0),
                  child:
                      // Adobe XD layer: 'Icon ionic-ios-lock' (shape)
                      SvgPicture.string(
                    _svg_bdy6hj,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 33.5, end: 33.5),
            Pin(size: 26.5, middle: 0.7632),
            child:
                // Adobe XD layer: 'Password' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    _svg_wc57a9,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 88.0, start: 47.0),
                  Pin(size: 21.0, start: 0.0),
                  child: Text(
                    'Full Name ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      letterSpacing: 1.0799999999999998,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 33.5, end: 33.5),
            Pin(size: 26.5, end: 135.5),
            child:
                // Adobe XD layer: 'Password' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    _svg_wc57a9,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 89.0, start: 47.0),
                  Pin(size: 21.0, start: 0.0),
                  child: Text(
                    'Car Name ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      letterSpacing: 1.0799999999999998,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, start: 10.9),
                  Pin(start: 1.7, end: 3.2),
                  child:
                      // Adobe XD layer: 'Icon awesome-car-alt' (shape)
                      SvgPicture.string(
                    _svg_85zxb7,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.8, start: 44.5),
            Pin(size: 27.8, middle: 0.7587),
            child:
                // Adobe XD layer: 'Icon material-person' (shape)
                SvgPicture.string(
              _svg_kbgf0i,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ey8jsz =
    '<svg viewBox="-8.3 -5.2 444.6 940.7" ><path transform="translate(-8.28, -5.24)" d="M 20.77378463745117 0 L 423.7851867675781 0 C 435.2582397460938 0 444.5589904785156 9.096831321716309 444.5589904785156 20.3183422088623 L 444.5589904785156 940.7391967773438 L 0 940.7391967773438 L 0 20.3183422088623 C 0 9.096831321716309 9.300739288330078 0 20.77378463745117 0 Z" fill="#0c2233" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wc57a9 =
    '<svg viewBox="30.5 741.5 361.0 1.0" ><path transform="translate(30.5, 741.5)" d="M 0 0 L 361 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bdy6hj =
    '<svg viewBox="37.0 706.0 23.1 30.0" ><path transform="translate(30.21, 702.63)" d="M 26.94187164306641 13.7594051361084 L 25.21113967895508 13.7594051361084 L 25.21113967895508 10.39168930053711 C 25.21113967895508 6.591290950775146 22.18235778808594 3.432705879211426 18.3819580078125 3.375014305114746 C 14.531081199646 3.324534893035889 11.36528396606445 6.461486339569092 11.36528396606445 10.29794120788574 L 11.36528396606445 13.7594051361084 L 9.634552955627441 13.7594051361084 C 8.048048973083496 13.7594051361084 6.75 15.05745506286621 6.75 16.64395904541016 L 6.75 30.48981094360352 C 6.75 32.07631301879883 8.048048973083496 33.37436294555664 9.634552955627441 33.37436294555664 L 26.94187164306641 33.37436294555664 C 28.52837371826172 33.37436294555664 29.82642364501953 32.07631301879883 29.82642364501953 30.48981094360352 L 29.82642364501953 16.64395904541016 C 29.82642364501953 15.05745506286621 28.52837371826172 13.7594051361084 26.94187164306641 13.7594051361084 Z M 19.29780578613281 22.75921058654785 L 19.29780578613281 27.72063827514648 C 19.29780578613281 28.26149368286133 18.87954330444336 28.73023223876953 18.33869171142578 28.75907897949219 C 17.76177978515625 28.78792762756348 17.27861785888672 28.32639694213867 17.27861785888672 27.74948692321777 L 17.27861785888672 22.75921058654785 C 16.44930648803711 22.35537528991699 15.90124225616455 21.4755859375 15.98778057098389 20.47320175170898 C 16.08873748779297 19.35543632507324 17.00458526611328 18.46122550964355 18.12234878540039 18.38190078735352 C 19.47087860107422 18.28815269470215 20.59585189819336 19.35543632507324 20.59585189819336 20.68233299255371 C 20.59585189819336 21.59817886352539 20.06942367553711 22.38421821594238 19.29780578613281 22.75921058654785 Z M 23.19195175170898 13.7594051361084 L 13.38447093963623 13.7594051361084 L 13.38447093963623 10.29794120788574 C 13.38447093963623 8.992681503295898 13.89647960662842 7.766746044158936 14.82674694061279 6.836477756500244 C 15.7570161819458 5.906210422515869 16.98295211791992 5.39420223236084 18.28821182250977 5.39420223236084 C 19.59346771240234 5.39420223236084 20.81940460205078 5.906210422515869 21.74967575073242 6.836477756500244 C 22.6799430847168 7.766746044158936 23.19195175170898 8.992681503295898 23.19195175170898 10.29794120788574 L 23.19195175170898 13.7594051361084 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qz6e9b =
    '<svg viewBox="36.3 710.8 24.0 26.5" ><path transform="translate(34.65, 710.76)" d="M 25.66714477539062 12.22218322753906 C 25.62944030761719 13.22268295288086 25.48183059692383 14.21600246429443 25.22697830200195 15.18423366546631 C 24.99064254760742 16.10943412780762 24.60137557983398 16.98864364624023 24.07524871826172 17.78554153442383 C 23.5622673034668 18.5467414855957 22.91194152832031 19.16397285461426 22.12261199951172 19.63393020629883 C 21.32831954956055 20.10223007202148 20.38013458251953 20.33720779418945 19.27143096923828 20.33720779418945 C 18.49368667602539 20.33720779418945 17.80695343017578 20.16842269897461 17.20957946777344 19.8325023651123 C 16.61386108398438 19.49658203125 16.1505241394043 19.02166175842285 15.81625652313232 18.4044303894043 C 14.88958263397217 19.65544128417969 13.64188098907471 20.28094673156738 12.07977199554443 20.28094673156738 C 11.39634990692139 20.28094673156738 10.77580833435059 20.12870597839355 10.21649360656738 19.82588386535645 C 9.64952278137207 19.51604461669922 9.168889999389648 19.06953811645508 8.818206787109375 18.52688026428223 C 8.420187950134277 17.90775680541992 8.144912719726562 17.21788024902344 8.007366180419922 16.49481964111328 C 7.837738037109375 15.62166213989258 7.802026748657227 14.72776985168457 7.901460647583008 13.84386348724365 C 8.040461540222168 12.65242385864258 8.311844825744629 11.56689071655273 8.708991050720215 10.59719085693359 C 9.106138229370117 9.625836372375488 9.602570533752441 8.796793937683105 10.20160007476807 8.110061645507812 C 10.79732036590576 7.423328876495361 11.48239612579346 6.893799781799316 12.25352382659912 6.524785995483398 C 13.03291893005371 6.154306411743164 13.88597774505615 5.964800357818604 14.74892616271973 5.97043514251709 C 15.31817054748535 5.97043514251709 15.81460285186768 6.0134596824646 16.24153518676758 6.097853183746338 C 16.66846466064453 6.183901309967041 17.05237579345703 6.299736499786377 17.39987945556641 6.445355892181396 C 17.74738311767578 6.594286441802979 18.06509780883789 6.759763717651367 18.35964965820312 6.951718330383301 C 18.65254592895508 7.140363216400146 18.94709777832031 7.335626602172852 19.23999404907227 7.534199714660645 L 18.51519775390625 15.87427616119385 C 18.46555709838867 16.27473258972168 18.47548294067383 16.59906959533691 18.53671264648438 16.85059547424316 C 18.59793853759766 17.09881019592285 18.69722366333008 17.30234909057617 18.83457183837891 17.45293426513672 C 18.97191619873047 17.60517311096191 19.13243103027344 17.70942306518555 19.31776809692383 17.7673397064209 C 19.90358352661133 17.95429611206055 20.54433822631836 17.82814407348633 21.01556777954102 17.43307495117188 C 21.36307144165039 17.15176391601562 21.66920471191406 16.76620101928711 21.92569351196289 16.27473068237305 C 22.1805305480957 15.78160762786865 22.38406753540039 15.19912624359131 22.5379638671875 14.53390502929688 C 22.6868896484375 13.86537551879883 22.77790451049805 13.14389324188232 22.80603408813477 12.36614799499512 C 22.88215637207031 10.88843154907227 22.76797485351562 9.536479949951172 22.46515274047852 8.315254211425781 C 22.16067504882812 7.094028949737549 21.66093063354492 6.048209190368652 20.96592712402344 5.181106567382812 C 20.24847412109375 4.298770427703857 19.32579803466797 3.605625867843628 18.278564453125 3.162278890609741 C 17.1864128112793 2.685703039169312 15.87913990020752 2.445760250091553 14.36336517333984 2.445760250091553 C 12.92370796203613 2.445760250091553 11.63298416137695 2.727072238922119 10.49118709564209 3.289696455001831 C 9.354789733886719 3.850861310958862 8.351606369018555 4.648667812347412 7.548995018005371 5.629549026489258 C 6.700847148895264 6.677639961242676 6.048380374908447 7.8699049949646 5.622834205627441 9.149263381958008 C 5.159496307373047 10.49790477752686 4.889768123626709 11.96238231658936 4.81199312210083 13.53442096710205 C 4.737527847290039 15.23884010314941 4.874874591827393 16.72813987731934 5.225687503814697 18.00893783569336 C 5.576499938964844 19.28973579406738 6.119267463684082 20.35872077941895 6.860607147216797 21.21589660644531 C 7.608151912689209 22.07973861694336 8.560641288757324 22.74204063415527 9.630703926086426 23.14205741882324 C 10.73940277099609 23.56733131408691 12.01358318328857 23.78079986572266 13.45323848724365 23.78079986572266 C 14.29618549346924 23.7718620300293 15.1363000869751 23.6815357208252 15.96187877655029 23.51107215881348 C 16.37557601928711 23.42833518981934 16.76775741577148 23.32904624938965 17.1417350769043 23.2198314666748 C 17.51571655273438 23.10896110534668 17.85329055786133 22.98816108703613 18.15776824951172 22.85577964782715 L 18.68233108520508 25.21549034118652 C 18.35137557983398 25.43061256408691 17.97077941894531 25.61925506591797 17.54550170898438 25.77811431884766 C 17.10636138916016 25.9362621307373 16.65755462646484 26.0661506652832 16.20182418823242 26.16698837280273 C 15.28037166595459 26.37252998352051 14.33941459655762 26.47794723510742 13.39532279968262 26.48139762878418 C 11.47246932983398 26.48139762878418 9.766395568847656 26.20670509338379 8.278750419616699 25.65732002258301 C 6.792760372161865 25.10793113708496 5.548368453979492 24.29047203063965 4.548883438110352 23.2049388885498 C 3.549397706985474 22.12106323242188 2.803093671798706 20.77241897583008 2.309969902038574 19.15569877624512 C 1.818500280380249 17.54063606262207 1.609998464584351 15.66411876678467 1.684463381767273 13.53442096710205 C 1.770511865615845 11.59171295166016 2.127943754196167 9.794625282287598 2.760068416595459 8.139847755432129 C 3.388883590698242 6.488380432128906 4.252676963806152 5.061962604522705 5.351449012756348 3.853975534439087 C 6.458833694458008 2.647359848022461 7.805103302001953 1.684289932250977 9.304710388183594 1.025962114334106 C 10.83372688293457 0.3408840596675873 12.53814697265625 0 14.42459106445312 0 C 16.30110931396484 0 17.95423126220703 0.2978598475456238 19.38561630249023 0.8886152505874634 C 20.81534194946289 1.481025457382202 22.01008987426758 2.311723470687866 22.96654891967773 3.387328624725342 C 23.92301177978516 4.462933540344238 24.63125610351562 5.750349998474121 25.09128189086914 7.247922420501709 C 25.55131149291992 8.745495796203613 25.74326705932617 10.40358352661133 25.66714477539062 12.22218322753906 Z M 11.45592212677002 13.84386348724365 C 11.35166931152344 15.07336235046387 11.44764709472656 16.00500297546387 11.74716186523438 16.63547325134277 C 12.04502201080322 17.2642879486084 12.52490711212158 17.57869529724121 13.18681907653809 17.57869529724121 C 13.35497379302979 17.57462882995605 13.52141666412354 17.54390907287598 13.67994117736816 17.4876823425293 C 13.86196804046631 17.42645645141602 14.05392169952393 17.31227684020996 14.24752902984619 17.14679908752441 C 14.44279289245605 16.98132133483887 14.6347484588623 16.74965286254883 14.82339191436768 16.4517936706543 C 15.01534557342529 16.15393257141113 15.19075107574463 15.76009654998779 15.35292053222656 15.2769021987915 L 15.91885471343994 8.796795845031738 C 15.63754081726074 8.720675468444824 15.33968067169189 8.680960655212402 15.03851222991943 8.680960655212402 C 14.46926975250244 8.680960655212402 13.98276424407959 8.796795845031738 13.57403469085693 9.016880035400391 C 13.15118598937988 9.25373649597168 12.79446506500244 9.59282112121582 12.53649234771729 10.0031270980835 C 12.22567558288574 10.50542068481445 11.99352931976318 11.05230617523193 11.84810447692871 11.62480640411377 C 11.67269802093506 12.27017116546631 11.54196834564209 13.00654792785645 11.45757579803467 13.842209815979 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="round" /></svg>';
const String _svg_85zxb7 =
    '<svg viewBox="41.4 716.7 27.0 21.6" ><path transform="translate(41.39, 712.21)" d="M 24.64210510253906 12.8325662612915 L 24.01068878173828 11.25402355194092 L 22.89110565185547 8.454780578613281 C 21.92993545532227 6.052139282226562 19.63739776611328 4.5 17.04937553405762 4.5 L 9.915040969848633 4.5 C 7.327579975128174 4.5 5.034481525421143 6.052139282226562 4.073312282562256 8.454780578613281 L 2.953727245330811 11.25402355194092 L 2.322310447692871 12.8325662612915 C 0.9673483967781067 13.34769916534424 0 14.64873123168945 0 16.18457984924316 L 0 18.88102340698242 C 0 19.78657722473145 0.3460433185100555 20.60393714904785 0.8988138437271118 21.23647689819336 L 0.8988138437271118 24.27390670776367 C 0.8988138437271118 25.26653289794922 1.703814029693604 26.071533203125 2.696441650390625 26.071533203125 L 4.494069576263428 26.071533203125 C 5.486697196960449 26.071533203125 6.291697025299072 25.26653289794922 6.291697025299072 24.27390670776367 L 6.291697025299072 22.47627830505371 L 20.67271995544434 22.47627830505371 L 20.67271995544434 24.27390670776367 C 20.67271995544434 25.26653289794922 21.47771835327148 26.071533203125 22.47034645080566 26.071533203125 L 24.26797485351562 26.071533203125 C 25.2606029510498 26.071533203125 26.06560325622559 25.26653289794922 26.06560325622559 24.27390670776367 L 26.06560325622559 21.23647689819336 C 26.61837387084961 20.60449981689453 26.96441650390625 19.78713989257812 26.96441650390625 18.88102340698242 L 26.96441650390625 16.18457984924316 C 26.96441650390625 14.64873123168945 25.99706840515137 13.34769916534424 24.64210510253906 12.8325662612915 Z M 7.411281585693359 9.790081024169922 C 7.820803165435791 8.766557693481445 8.812307357788086 8.095254898071289 9.915040016174316 8.095254898071289 L 17.04937553405762 8.095254898071289 C 18.15210723876953 8.095254898071289 19.14361190795898 8.766557693481445 19.55313301086426 9.790081024169922 L 20.67271995544434 12.58932495117188 L 6.291697025299072 12.58932495117188 L 7.411282062530518 9.790081024169922 Z M 4.494069576263428 18.86978721618652 C 3.41549277305603 18.86978721618652 2.696441650390625 18.15298271179199 2.696441650390625 17.0777759552002 C 2.696441650390625 16.0025691986084 3.41549277305603 15.28576564788818 4.494069576263428 15.28576564788818 C 5.572646141052246 15.28576564788818 7.190510749816895 16.8985767364502 7.190510749816895 17.97378158569336 C 7.190510749816895 19.04898643493652 5.572646141052246 18.86978721618652 4.494069576263428 18.86978721618652 Z M 22.47034645080566 18.86978721618652 C 21.39176940917969 18.86978721618652 19.77390480041504 19.04898834228516 19.77390480041504 17.97378158569336 C 19.77390480041504 16.89857482910156 21.39176940917969 15.28576564788818 22.47034645080566 15.28576564788818 C 23.54892349243164 15.28576564788818 24.26797485351562 16.00257110595703 24.26797485351562 17.07777786254883 C 24.26797485351562 18.15298461914062 23.54892349243164 18.86978912353516 22.47034645080566 18.86978912353516 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kbgf0i =
    '<svg viewBox="44.5 681.5 27.8 27.8" ><path transform="translate(38.5, 675.5)" d="M 19.9052734375 19.9052734375 C 23.74660682678223 19.9052734375 26.85791015625 16.79397010803223 26.85791015625 12.95263671875 C 26.85791015625 9.11130428314209 23.74660682678223 6 19.9052734375 6 C 16.06394195556641 6 12.95263671875 9.11130428314209 12.95263671875 12.95263671875 C 12.95263671875 16.79397010803223 16.06394195556641 19.9052734375 19.9052734375 19.9052734375 Z M 19.9052734375 23.381591796875 C 15.26438903808594 23.381591796875 6 25.71072578430176 6 30.33423042297363 L 6 33.810546875 L 33.810546875 33.810546875 L 33.810546875 30.33423042297363 C 33.810546875 25.71072578430176 24.5461597442627 23.381591796875 19.9052734375 23.381591796875 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';