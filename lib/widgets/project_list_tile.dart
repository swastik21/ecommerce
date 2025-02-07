import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  final Function? onPressed;
  final Function onDelete;

  const ProductListTile({
    Key? key,
    required this.product,
    this.onPressed,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: ((c) => onDelete()),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ]),
        child: GestureDetector(
          onTap: () {
            if (onPressed != null) {
              onPressed!();
            }
          },
          child: Container(
            width: screenSize.width,
            height: 75,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.5),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(10, 20),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.05),
                  ),
                ]),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.imageUrl,
                      height: 59,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: screenSize.width / 2.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        product.description,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  "₹${product.price}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
