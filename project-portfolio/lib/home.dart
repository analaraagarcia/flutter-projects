import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectnoobs/models/category.dart';
import 'package:projectnoobs/models/contact.dart';
import 'package:projectnoobs/models/doctor.dart';
import 'package:projectnoobs/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoryModel> categoriesData = CategoryModel.getCategories();
  final List<ContactModel> contactsData = ContactModel.getContacts();
  final List<DoctorModel> doctorsData = DoctorModel.getDoctors();

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [header(), categories(), doctors()],
        ),
      ),
    );
  }

  Column categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
          ),
          child: Text(
            'Linguagens de\nProgramação',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.all(16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    for (var item in categoriesData) {
                      item.isSelected = false;
                    }
                    categoriesData[index].isSelected = true;
                    setState(() {});
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: categoriesData[index].isSelected
                                  ? const Color.fromARGB(255, 198, 66, 216)
                                      .withOpacity(0.45)
                                  : const Color(0xff050618).withOpacity(0.09),
                              offset: const Offset(0, 4),
                              blurRadius: 25)
                        ],
                        color: categoriesData[index].isSelected
                            ? const Color.fromARGB(255, 198, 66, 216)
                            : Colors.white),
                    child: SvgPicture.asset(
                      categoriesData[index].vector,
                      fit: BoxFit.none,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 40,
                  ),
              itemCount: categoriesData.length),
        )
      ],
    );
  }

  Container header() {
    return Container(
      color: const Color.fromARGB(255, 198, 66, 216),
      width: double.infinity,
      height: 184,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Meu Portfólio',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  'assets/vectors/notification.svg',
                  fit: BoxFit.none,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          const Text(
            "Olá, meu nome\né Ana Lara",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget doctors() {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      doctorModel: doctorsData[index],
                    ),
                  ));
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 198, 66, 216)
                            .withOpacity(0.2),
                        offset: const Offset(0, 4),
                        blurRadius: 20)
                  ]),
              child: Row(
                children: [
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                        color: doctorsData[index].imageBox,
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            image: AssetImage(doctorsData[index].image))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorsData[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          doctorsData[index].specialties.first,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  5,
                                  (index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 18,
                                      )),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
        itemCount: doctorsData.length);
  }

  // Column footer() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Padding(
  //         padding: EdgeInsets.only(
  //           top: 15,
  //           left: 15,
  //         ),
  //         child: Text(
  //           'Contato',
  //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
  //         ),
  //       ),
  //       Container(
  //         height: 30,
  //         margin: const EdgeInsets.all(16),
  //         child: ListView.separated(
  //             scrollDirection: Axis.horizontal,
  //             itemBuilder: (context, index) {
  //               return GestureDetector(
  //                 onTap: () {
  //                   for (var item in contactsData) {
  //                     item.isSelected = false;
  //                   }
  //                   contactsData[index].isSelected = true;
  //                   setState(() {});
  //                 },
  //                 child: Container(
  //                   width: 50,
  //                   height: 50,
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       boxShadow: [
  //                         BoxShadow(
  //                             color: contactsData[index].isSelected
  //                                 ? const Color.fromARGB(255, 198, 66, 216)
  //                                     .withOpacity(0.45)
  //                                 : const Color(0xff050618).withOpacity(0.09),
  //                             offset: const Offset(0, 4),
  //                             blurRadius: 25)
  //                       ],
  //                       color: contactsData[index].isSelected
  //                           ? const Color.fromARGB(255, 198, 66, 216)
  //                           : Colors.white),
  //                   child: SvgPicture.asset(
  //                     contactsData[index].vector,
  //                     fit: BoxFit.none,
  //                   ),
  //                 ),
  //               );
  //             },
  //             separatorBuilder: (context, index) => const SizedBox(
  //                   width: 40,
  //                 ),
  //             itemCount: contactsData.length),
  //       )
  //     ],
  //   );
  // }
}
