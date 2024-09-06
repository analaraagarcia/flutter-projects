import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectnoobs/models/contact.dart';
import 'package:projectnoobs/models/person.dart';

class DetailPage extends StatefulWidget {
  final PersonModel personModel;
  const DetailPage({required this.personModel, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<ContactModel> contactData = [];

  @override
  void initState() {
    super.initState();
    contactData = ContactModel.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 198, 66, 216),
        centerTitle: true,
        toolbarHeight: 100,
        leadingWidth: 100,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 25,
                        offset: const Offset(0, 4))
                  ]),
              child: const Icon(Icons.arrow_back),
            )),
        title: const Text(
          'Informações Pessoais',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            info(),
            const SizedBox(
              height: 30,
            ),
            contact(),
          ],
        ),
      ),
    );
  }

  Widget info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 110,
          child: Row(
            children: [
              Container(
                width: 110,
                decoration: BoxDecoration(
                    color: widget.personModel.imageBox,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage(widget.personModel.image))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.personModel.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.personModel.specialties.first,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                    const Spacer(),
                    Row(
                      children: [
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
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Biografia',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.personModel.bio,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Especialidades',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Text(
                widget.personModel.specialties[index],
                style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: widget.personModel.specialties.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }

  Widget contact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Entre em contato',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    for (var item in contactData) {
                      item.isSelected = false;
                    }
                    contactData[index].isSelected = true;
                    setState(() {});
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: contactData[index].isSelected
                                  ? const Color.fromARGB(255, 198, 66, 216)
                                      .withOpacity(0.45)
                                  : const Color(0xff050618).withOpacity(0.09),
                              offset: const Offset(0, 2),
                              blurRadius: 15)
                        ],
                        color: contactData[index].isSelected
                            ? const Color.fromARGB(255, 198, 66, 216)
                            : Colors.white),
                    child: SvgPicture.asset(
                      contactData[index].vector,
                      fit: BoxFit.none,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 40,
                  ),
              itemCount: contactData.length),
        )
      ],
    );
  }
}
