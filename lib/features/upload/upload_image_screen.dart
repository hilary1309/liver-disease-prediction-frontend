import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ldp_prediction/components/custom_button_load.dart';
import 'package:ldp_prediction/components/custom_network_image.dart';
import 'package:ldp_prediction/core/provider/user_provider.dart';
import 'package:ldp_prediction/utils/size.dart';
import 'package:ldp_prediction/utils/sizeConfig.dart';
import 'package:ldp_prediction/utils/text_style.dart';
import 'package:provider/provider.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? file;
  String _filePath = "";

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
          child: Column(
            children: [
              vertical10,
              Text(
                "Upload image sample",
                style: txStyle25Bold,
              ),
              vertical10,
              Center(
                child: Text(
                  "Upload image sample for detailed analytics with best machine learning engine",
                  style: txStyle14.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              vertical30,
              file != null
                  ? Column(
                      children: [
                        SizedBox(
                          height: 175,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                  // color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: FileImage(
                                        file!,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        vertical30,
                        CustomButtonLoad(
                          label: "Upload",
                          userProv: userProvider.uploadImageState,
                          onTap: () {
                            userProvider.uplaodImage(_filePath);
                          },
                        ),
                        vertical20,
                        InkWell(
                          onTap: () {
                            setState(() {
                              file = null;
                              _filePath = "";
                            });
                          },
                          child: Text(
                            "Clear",
                            style: txStyle14.copyWith(
                                color: Colors.red,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    )
                  : InkWell(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(type: FileType.image);
                        if (result != null) {
                          setState(() {
                            file = File(result.files.single.path!);
                            _filePath = result.files.single.path!;
                          });

                          log(_filePath);
                        } else {
                          // showErrorToast(error: "No image selected", type: "info");
                          return;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Row(
                            children: [
                              const CustomNetworkImageSqr(
                                  imageUrl:
                                      "https://play-lh.googleusercontent.com/mlR3AHmDvRYxBLf2Vwr8gy6C7wU6Uj9JrudQ2tUT9JrYbLL0zDiPBszvArZmPgNYUwM=w240-h480-rw",
                                  height: 50,
                                  width: 50),
                              horizontalx10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Upload image from gallery",
                                    style: txStyle16,
                                  ),
                                  vertical5,
                                  Text(
                                    "Select an image and upload it for scanning",
                                    style:
                                        txStyle14.copyWith(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
