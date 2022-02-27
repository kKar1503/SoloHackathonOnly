import 'package:application_frontend/components/app_bar.dart';
import 'package:application_frontend/components/nav_drawer.dart';
import 'package:application_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var urlList = [
    "https://envato-shoebox-0.imgix.net/3d5d/b36e-65ea-43b3-937d-f5008dd67207/hb93.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=55931f8bad4a242eca8a7f80b0581785",
    "https://envato-shoebox-0.imgix.net/4cc7/719b-3879-4d72-8874-4feda468b4e6/Seniorcov58.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=8dc2b5621a569de42508654d880523e7",
    "https://envato-shoebox-0.imgix.net/5bba/8941-c3f9-4686-967c-034e6f0bdd4a/150945134.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=58e55d11c9bc96c52dc3eadeacbefc18",
    "https://envato-shoebox-0.imgix.net/2a5a/4edf-e93f-4e56-92f5-472d061624da/AW4V6689_TDJ.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=970547603190fffe6a5deabc3d25eab6",
    "https://envato-shoebox-0.imgix.net/b5c9/ccf9-8f47-4372-9d81-d21980fed23e/IS098SU9U.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=3dc92b253257898ec1c189a37932d1bb",
    "https://envato-shoebox-0.imgix.net/3d5d/b36e-65ea-43b3-937d-f5008dd67207/hb93.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=55931f8bad4a242eca8a7f80b0581785",
    "https://envato-shoebox-0.imgix.net/4cc7/719b-3879-4d72-8874-4feda468b4e6/Seniorcov58.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=8dc2b5621a569de42508654d880523e7",
    "https://envato-shoebox-0.imgix.net/5bba/8941-c3f9-4686-967c-034e6f0bdd4a/150945134.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=58e55d11c9bc96c52dc3eadeacbefc18",
    "https://envato-shoebox-0.imgix.net/2a5a/4edf-e93f-4e56-92f5-472d061624da/AW4V6689_TDJ.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=970547603190fffe6a5deabc3d25eab6",
    "https://envato-shoebox-0.imgix.net/b5c9/ccf9-8f47-4372-9d81-d21980fed23e/IS098SU9U.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=3dc92b253257898ec1c189a37932d1bb",
    "https://envato-shoebox-0.imgix.net/3d5d/b36e-65ea-43b3-937d-f5008dd67207/hb93.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=55931f8bad4a242eca8a7f80b0581785",
    "https://envato-shoebox-0.imgix.net/4cc7/719b-3879-4d72-8874-4feda468b4e6/Seniorcov58.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=8dc2b5621a569de42508654d880523e7",
    "https://envato-shoebox-0.imgix.net/5bba/8941-c3f9-4686-967c-034e6f0bdd4a/150945134.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=58e55d11c9bc96c52dc3eadeacbefc18",
    "https://envato-shoebox-0.imgix.net/2a5a/4edf-e93f-4e56-92f5-472d061624da/AW4V6689_TDJ.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=970547603190fffe6a5deabc3d25eab6",
    "https://envato-shoebox-0.imgix.net/b5c9/ccf9-8f47-4372-9d81-d21980fed23e/IS098SU9U.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=3dc92b253257898ec1c189a37932d1bb",
    "https://envato-shoebox-0.imgix.net/3d5d/b36e-65ea-43b3-937d-f5008dd67207/hb93.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=55931f8bad4a242eca8a7f80b0581785",
    "https://envato-shoebox-0.imgix.net/4cc7/719b-3879-4d72-8874-4feda468b4e6/Seniorcov58.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=8dc2b5621a569de42508654d880523e7",
    "https://envato-shoebox-0.imgix.net/5bba/8941-c3f9-4686-967c-034e6f0bdd4a/150945134.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=58e55d11c9bc96c52dc3eadeacbefc18",
    "https://envato-shoebox-0.imgix.net/2a5a/4edf-e93f-4e56-92f5-472d061624da/AW4V6689_TDJ.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=970547603190fffe6a5deabc3d25eab6",
    "https://envato-shoebox-0.imgix.net/b5c9/ccf9-8f47-4372-9d81-d21980fed23e/IS098SU9U.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=900&s=3dc92b253257898ec1c189a37932d1bb",
  ];

  var titleList = ["Dr. Yam", "Dr. May", "Dr. Cool", "Dr. Jia", "Dr. Lurr"];
  var subList = [
    "Rectal Surgeon, Dr. Yam has 10 years of experience at the operating table, you will surely be in good hands!",
    "Dermatologist, Dr. May is surely your go to guy for any skin problems",
    "Oncologist, Dr. Cool specialises in chemotherapy treatments and often works with radiation oncologists and surgeons to care for someone with cancer",
    "Ophthalmologist, Dr, Jia is an eye doctor, and can treat every kind of eye condition as well as operate on the eyes",
    "Pediatricians, Dr. Lurr specialises in care for children from birth to young adulthood and children's developmental issues."
  ];
  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return Scaffold(
      appBar: CustomAppBar(title: "Home"),
      drawer: NavDrawer(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: 10,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) => Card(
              child: Image.network(urlList[index]),
            ),
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //Card is LEFT swiping
              } else if (align.x > 0) {
                //Card is RIGHT swiping
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Container(
                        height: 200,
                        child: Column(children: [
                          Text(
                            titleList[index % 5],
                            style: TextStyle(
                                color: navyBlue,
                                fontSize: 20,
                                fontWeight: kbold),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              subList[index % 5],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: navyBlue,
                                  fontSize: 17,
                                  fontWeight: kbold),
                            ),
                          )
                        ]),
                        decoration: BoxDecoration(color: offWhite),
                      ),
                    );
                  });

              /// Get orientation & index of swiped card!
            },
          ),
        ),
      ),
    );
  }
}
