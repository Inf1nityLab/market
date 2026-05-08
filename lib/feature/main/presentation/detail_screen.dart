import 'package:flutter/material.dart';
import 'package:marketplace/feature/main/model/products_model.dart';
import 'package:marketplace/shared/circle_button.dart';
import 'package:marketplace/shared/sized_box_widget.dart';

import '../../../shared/view_all_widget.dart';

class DetailScreen extends StatefulWidget {
  final ProductsModel productsModel;
  const DetailScreen({super.key, required this.productsModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MainProductBody(image: widget.productsModel.imageUrl,),
          SizesBoxWidget(height: 10),
          PriceBody(name: widget.productsModel.name, price: widget.productsModel.price),
          SizesBoxWidget(height: 10),
          ImagesBody(),
          SizesBoxWidget(height: 10),
          ViewAllWidget(title: 'Size', onTap: () {}, text: 'Size Guied'),
          SizesBoxWidget(height: 10),
          SizesBody(),
          SizesBoxWidget(height: 10),
          DescriptionBody(),
          SizesBoxWidget(height: 10),
          ViewAllWidget(title: 'Reviews', onTap: () {}),
        ],
      ),
    );
  }
}

class MainProductBody extends StatelessWidget {
  final String image;
  const MainProductBody({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 400,
        width: double.infinity,
        color: Colors.grey.shade100,
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
      
            Align(
              alignment: Alignment.topRight,
              child: CircleButton(image: 'assets/images/wom.png'),
            ),
            Align(alignment: Alignment.topLeft, child: CircleButton()),
          ],
        ),
      ),
    );
  }
}

class PriceBody extends StatelessWidget {
  final String name;
  final int price;
  const PriceBody({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: .min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Hjghjghj'), Text('Price')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(name), Text('\$$price')],
          ),
        ],
      ),
    );
  }
}

class ImagesBody extends StatelessWidget {
  const ImagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: 100,
      
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                image: DecorationImage(
                  image: AssetImage('assets/images/wom.png'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SizesBody extends StatelessWidget {
  const SizesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(right: 10),
            );
          },
        ),
      ),
    );
  }
}

class DescriptionBody extends StatelessWidget {
  const DescriptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: .min,
        children: [
          Text('Description'),

        ],
      ),
    );
  }
}
