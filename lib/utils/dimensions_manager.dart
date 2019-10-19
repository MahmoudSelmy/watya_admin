import 'package:flutter/widgets.dart';


class DimensionsManager
{
  MediaQueryData _mediaQueryData;
  double _screenWidth;
  double _screenHeight;
  double _blockSizeHorizontal;
  double _blockSizeVertical;

  void init(BuildContext context) 
  {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;
  }

  double convertBlocksToVerticalDimen(int numberOfBlocks)
  {
    return numberOfBlocks * _blockSizeVertical;
  }

  double convertBlocksToHorizontalDimen(int numberOfBlocks)
  {
    return numberOfBlocks * _blockSizeHorizontal;
  }
}