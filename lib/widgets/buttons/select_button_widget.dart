import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:fast_work_app/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_view/flutter_picker_view.dart';

class SelectButton extends StatefulWidget {
  final String title;
  final Function onConfirm;
  final Function section;
  final Function itemBuilder;
  final int selectedItem;
  final double widthState;
  final bool enable;

  const SelectButton(
      {@required this.title,
      @required this.onConfirm,
      @required this.section,
      @required this.selectedItem,
      @required this.itemBuilder,
      @required this.widthState,
      @optionalTypeArgs this.enable = true});

  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
        ),
        child: _crearPickerField(),
        onPressed: () {
          if (widget.enable != null) {
            if (widget.enable) {
              _showPicker();
            }
          } else {
            _showPicker();
          }
        },
      ),
    );
  }

  Widget _crearPickerField() {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: <Widget>[
            Container(
              width: size.width * widget.widthState,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextScalableWidget(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  context: context,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Icon(
                Icons.arrow_drop_down,
                color: blackGlobal,
              ),
            )
          ],
        ),
        Container(padding: EdgeInsets.only(top: 5)),
        Container(
          width: double.infinity,
          height: 0.5,
          color: blackGlobal,
        )
      ],
    );
  }

  void _showPicker() {
    PickerController pickerController =
        PickerController(count: 1, selectedItems: [widget.selectedItem ?? 0]);

    PickerViewPopup.showMode(
        PickerShowMode.BottomSheet, // AlertDialog or BottomSheet

        controller: pickerController,
        context: context,
        title: TextScalableWidget(
          widget.title,
          context: context,
        ),
        cancel: TextScalableWidget(
          'Cancelar',
          context: context,
        ),
        onCancel: () {},
        confirm: TextScalableWidget(
          'Aceptar',
          context: context,
        ),
        onConfirm: widget.onConfirm, builder: (context, popup) {
      return Container(
        height: 300,
        child: popup,
      );
    },
        itemExtent: 40,
        numberofRowsAtSection: widget.section,
        itemBuilder: widget.itemBuilder);
  }
}
