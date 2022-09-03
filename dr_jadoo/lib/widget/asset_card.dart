import 'package:dr_jadoo/constants/assets.dart';
import 'package:dr_jadoo/constants/colours.dart';
import 'package:dr_jadoo/model/Asset/asset_response.dart';
import 'package:flutter/material.dart';

class AssetCard extends StatefulWidget {
  const AssetCard({super.key, this.asset});
  final AssetResponse? asset;
  @override
  State<AssetCard> createState() => _AssetCardState();
}

class _AssetCardState extends State<AssetCard> {
  
  bool showAssetDetails = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 310,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(color: AppColors.grey, blurRadius: 2.5)
        ]
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Container(
          key: ValueKey<bool>(showAssetDetails),
          child: !showAssetDetails
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Image.asset(widget.asset!.assignedAsset!.category! == 'Laptop'
                          ? Assets.laptopPlaceholder
                          : Assets.mobilePlaceholder, 
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right:12,
                    top:12,
                    child: Container(
                      height: 25,
                      width: 65,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        border: Border.all(color: AppColors.success),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Center(child: Text('Good', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.white),)),
                    )
                  ),
                  
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.asset!.assignedAsset!.name!, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.black),),
                      Text(
                          '(${widget.asset!.assignedAsset!.model})', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: AppColors.black),),
                      Text(widget.asset!.assignedAsset!.category!, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: AppColors.grey),),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showAssetDetails = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 65,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(246, 255, 236, 184),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: const [
                          Center(
                            child: Text('View Details'),
                          ),
                          Center(
                            child: Icon(Icons.arrow_forward, color: AppColors.black, size: 18,) 
                          )
                         ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ) : Container(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                    onPressed: () {
                    setState(() {
                              showAssetDetails = false;
                            });
                }, icon: Icon(Icons.arrow_back_ios)),
                Text(
                      '${widget.asset!.assignedAsset!.name!} Details', style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.black),),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(
                      'Product Name', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.grey),),
                    Text(
                      widget.asset!.assignedAsset!.name!, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.black),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(
                      'Model', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.grey),),
                    Text(
                      widget.asset!.assignedAsset!.model!, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.black),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(
                      'Category', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.grey),),
                    Text(
                      widget.asset!.assignedAsset!.category!, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.black),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(
                      'Category Type', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.grey),),
                    Text(
                      widget.asset!.assignedAsset!.categoryType!, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.black),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(
                      'Purchase Date', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.grey),),
                    Text(
                      widget.asset!.assignedAsset!.purchaseDate!, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.black),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(
                      'Manufacture Date', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.grey),),
                    Text(
                      widget.asset!.assignedAsset!.manufacturedDate!, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.black),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(
                      'Assigned By', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.grey),),
                    Text(
                      widget.asset!.approvedBy!.username!, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.black),),
                      ],
                    )
                    
                  ],
                )
              ],
            )
          )
        ),
      ),
    );
  }
}
