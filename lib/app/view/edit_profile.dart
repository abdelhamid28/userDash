 
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/app/backend/models/studies_model.dart';
import 'package:user/app/backend/models/terms_model.dart';
import 'package:user/app/controller/edit_profile_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/util/theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          appBar: AppBar(
            title: Text('Update Profile'.tr, style: ThemeProvider.titleStyle),
            backgroundColor: ThemeProvider.appColor,
            automaticallyImplyLeading: true,
            elevation: 0.0,
            centerTitle: false,
          ),
          body: value.apiCalled == false
              ? const Center(child: CircularProgressIndicator(color: ThemeProvider.appColor))
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    child: GestureDetector(
                                      onTap: () {
                                        showCupertinoModalPopup<void>(
                                          context: context,
                                          builder: (BuildContext context) => CupertinoActionSheet(
                                            title: Text('Choose From'.tr),
                                            actions: <CupertinoActionSheetAction>[
                                              CupertinoActionSheetAction(
                                                child: Text('Gallery'.tr),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  value.selectFromGallery('gallery');
                                                },
                                              ),
                                              CupertinoActionSheetAction(
                                                child: Text('Camera'.tr),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  value.selectFromGallery('camera');
                                                },
                                              ),
                                              CupertinoActionSheetAction(
                                                child: Text('Cancel'.tr, style: const TextStyle(fontFamily: 'bold', color: ThemeProvider.redColor)),
                                                onPressed: () => Navigator.pop(context),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(40),
                                          child: FadeInImage(
                                            image: NetworkImage('${Environments.apiBaseURL}storage/images/${value.cover}'),
                                            placeholder: const AssetImage("assets/images/placeholder.jpeg"),
                                            imageErrorBuilder: (context, error, stackTrace) {
                                              return Image.asset('assets/images/notfound.png', fit: BoxFit.fitWidth);
                                            },
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        TextField(
                          controller: value.firstName,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            labelText: 'First Name'.tr,
                            floatingLabelStyle: const TextStyle(color: ThemeProvider.greyColor),
                            suffixIcon: const Icon(Icons.account_circle_outlined),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: (ThemeProvider.greyColor[300])!)),
                            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 2, color: ThemeProvider.appColor)),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          controller: value.lastName,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            labelText: 'Last Name'.tr,
                            floatingLabelStyle: const TextStyle(color: ThemeProvider.greyColor),
                            suffixIcon: const Icon(Icons.account_circle_outlined),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: (ThemeProvider.greyColor[300])!)),
                            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 2, color: ThemeProvider.appColor)),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ThemeProvider.greyColor[300]!))),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                  child: InkWell(
                                    onTap: () {
                                      showCountryPicker(
                                        context: context,
                                        exclude: <String>['KN', 'MF'],
                                        showPhoneCode: true,
                                        showWorldWide: false,
                                        onSelect: (Country country) => value.saveCountryCode(country.phoneCode),
                                        countryListTheme: CountryListThemeData(
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                                          inputDecoration: InputDecoration(
                                            labelText: 'Search'.tr,
                                            hintText: 'Start typing to search'.tr,
                                            prefixIcon: const Icon(Icons.search),
                                            border: OutlineInputBorder(borderSide: BorderSide(color: const Color(0xFF8C98A8).withOpacity(0.2))),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(value.countryCode),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 10,
                                child: TextField(
                                  controller: value.mobile,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(border: InputBorder.none, labelText: 'Phone Number'.tr),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: value.enrollment,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            labelText: 'Enrollment Number'.tr,
                            floatingLabelStyle: const TextStyle(color: ThemeProvider.greyColor),
                            suffixIcon: const Icon(Icons.numbers_outlined),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: (ThemeProvider.greyColor[300])!)),
                            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 2, color: ThemeProvider.appColor)),
                          ),
                        ),
                        const SizedBox(height: 24),
                        value.haveStudies == true
                            ? SizedBox(
                                width: double.infinity,
                                child: DropdownButton<StudiesModel>(
                                  isExpanded: true,
                                  value: value.selectedStudies,
                                  items: value.studiesList.map((StudiesModel value) {
                                    return DropdownMenuItem<StudiesModel>(value: value, child: Text(value.name.toString()));
                                  }).toList(),
                                  onChanged: (newValue) {
                                    value.onStudiesChanged(newValue as StudiesModel);
                                  },
                                ),
                              )
                            : Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ThemeProvider.greyColor[300]!))),
                                child: Text('Select Studies'.tr),
                              ),
                        const SizedBox(height: 24),
                        value.haveTerms == true
                            ? SizedBox(
                                width: double.infinity,
                                child: DropdownButton<TermsModel>(
                                  isExpanded: true,
                                  value: value.selectedTerms,
                                  items: value.termsList.map((TermsModel value) {
                                    return DropdownMenuItem<TermsModel>(value: value, child: Text(value.name.toString()));
                                  }).toList(),
                                  onChanged: (newValue) {
                                    value.onTermsChanged(newValue as TermsModel);
                                  },
                                ),
                              )
                            : Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ThemeProvider.greyColor[300]!))),
                                child: Text('Select Terms'.tr),
                              ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          height: 40,
                          margin: const EdgeInsets.only(bottom: 24),
                          child: ElevatedButton(
                            onPressed: () => value.register(),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: ThemeProvider.whiteColor,
                              backgroundColor: ThemeProvider.appColor,
                              elevation: 0,
                              textStyle: const TextStyle(fontFamily: 'medium', letterSpacing: 0.5, fontSize: 16),
                            ),
                            child: Text('Update'.tr),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
