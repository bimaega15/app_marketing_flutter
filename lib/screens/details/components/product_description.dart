// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';

List<String> jobs = [
  'Melakukan negosiasi dengan direktur RS Jiwa Tampan',
  'Melakukan verifikasi surat Satu Sehat',
  'Serah Terima Alkes',
];
List<String> users = [
  'Bima (Developer)',
  'Rasmi (Onboarding Special)',
  'Bos Klinik (Owner)',
  'Big Bos (Komisaris)',
];

class Item {
  Item({
    required this.headerValue,
    this.isExpanded = false,
  });

  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: index == 0 ? 'Kunjungan Outlet' : 'User Outlet',
    );
  });
}

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  List<bool> jobStatus = List<bool>.generate(3, (index) => false);
  late final List<Item> _data = generateItems(2);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 48,
            decoration: BoxDecoration(
              color: widget.product.isFavourite
                  ? const Color(0xFFFFE6E6)
                  : const Color(0xFFF5F6F9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              colorFilter: ColorFilter.mode(
                  widget.product.isFavourite
                      ? const Color(0xFFFF4848)
                      : const Color(0xFFDBDEE4),
                  BlendMode.srcIn),
              height: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            widget.product.description,
            maxLines: 3,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = isExpanded;
            });
          },
          children: [
            ..._data.asMap().entries.map((entry) {
              int index = entry.key;
              Item item = entry.value;

              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      item.headerValue,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                },
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (index == 0) ...KunjunganOutlet(),
                    if (index == 1) ...UserOutlet()
                  ],
                ),
                isExpanded: item.isExpanded,
              );
            }),
          ],
        ),
      ],
    );
  }

  List<Widget> UserOutlet() {
    return List.generate(
      users.length,
      (index) => Card(
        child: ListTile(
          title: Text(
            users[index],
            style: const TextStyle(fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  List<Widget> KunjunganOutlet() {
    return List.generate(
      jobs.length,
      (index) => Card(
        child: ListTile(
          title: Text(
            jobs[index],
            style: const TextStyle(fontSize: 14.0),
          ),
          trailing: Checkbox(
            value: jobStatus[index],
            onChanged: (value) {
              setState(() {
                jobStatus[index] = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
