import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alphaai/constants/theme_data.dart';
import 'package:alphaai/providers/size_provider.dart';
import 'package:alphaai/pages/image_gallery.dart';
import 'package:alphaai/widgets/count_dropdown.dart';
import 'package:alphaai/widgets/size_dropdown.dart';
import 'package:alphaai/widgets/text_widget.dart';

class Services{

  static Future<void>showImageOptions({required context})async{
    final sizesProvider = Provider.of<SizesProvider>(context,listen: false);
    String currentSize = sizesProvider.currentSize;
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        context: context,
        builder: (context){
          return SizedBox(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children:  [
                        Flexible(child: TextWidget(label: 'Image Size :',fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )),
                        const SizedBox(width: 30,),
                        const Flexible(
                          flex: 2,
                          child: SizesDropdown(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 1,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                    child: Row(
                      children:  [
                        Flexible(child: TextWidget(label: 'No of Images :',fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )),
                        const SizedBox(width: 30,),
                        const Flexible(
                          flex: 2,
                          child: ImageCountDropdown(),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                    child: Row(
                      children: [
                        Text('My Gallery ',style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        const SizedBox(width: 60,),
                        // SwitchListTile(value: value, onChanged: onChanged),
                        ElevatedButton.icon(
                          onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewImage()));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                            backgroundColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                          label: Text(
                            'Open Gallery',
                            style: TextStyle(color: Theme.of(context).colorScheme.primary
                                ,fontSize: 15),
                          ),
                          icon: Icon(Icons.open_in_new,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              )
          );
        });
  }
}
