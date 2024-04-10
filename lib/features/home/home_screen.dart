//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
//import 'package:flutter/widgets.dart';
import 'package:ldp_prediction/components/custom_network_image.dart';
import 'package:ldp_prediction/constant/responsive_state.dart';
import 'package:ldp_prediction/core/provider/user_provider.dart';
import 'package:ldp_prediction/features/home/result_details.dart';
import 'package:ldp_prediction/utils/size.dart';
import 'package:ldp_prediction/utils/sizeConfig.dart';
import 'package:ldp_prediction/utils/text_style.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserProvider? userProv;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userProv =
          Provider.of<UserProvider>(context, listen: false);
          userProv!.fetchResult();
    });
  }
  

  @override
  Widget build(BuildContext context) {
      var userProvider =
          Provider.of<UserProvider>(context);
    return Scaffold(
      body: ResponsiveState(
        state:userProvider.fetchResultState,
        idleWidget: const SizedBox.shrink(),
        busyWidget: const Center(child: CircularProgressIndicator()) ,
        successWidget: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
          child: Column(
            children: [
              Text(
                "All Scans",
                style: txStyle25Bold,
              ),
              vertical30,
              Expanded(
                child: ListView.builder(
                    itemCount: userProvider.resultList.length,
                    itemBuilder: (context, index) {
                      var data = userProvider.resultList.elementAt(index);
                      return Padding(
                      
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(ResultDetailScreen(details: data));
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomNetworkImageSqr(
                                      imageUrl:
                                        // "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Human_liver_with_metastatic_lesions_from_primary_pancreas_carcinoma_%282%29.jpg/640px-Human_liver_with_metastatic_lesions_from_primary_pancreas_carcinoma_%282%29.jpg",
                                        "${data.imageUrl}",
                                      height: 60,
                                      width: 60),
                                      horizontalx10,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Liver disease $index",
                                        style: txStyle16,
                                      ),
                                      vertical5,
                                      Text(
                                        "${data.highestConfidenceClass}",
                                        style: txStyle13,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () async {
                          
                                    bool res = await  userProvider.deleteResult(id: "${data.id}");
                                    if (res){
                                      userProvider.fetchResult();
                                    }
                                    },
                                    child: const Icon(
                                      Icons.delete_forever_sharp,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                              vertical10,
                              const Divider(
                                height: 0,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
        )
    );
  }
}
