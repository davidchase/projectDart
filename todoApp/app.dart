library todo;

import 'dart:math' show Random;
import 'dart:html' show Event, 
                        Storage, 
                        window, 
                        InputElement,
                        UListElement, 
                        LIElement, 
                        querySelector;
import 'dart:convert' show JSON;

part 'utils.dart';
part 'dom.dart';

void main(){
    new TodoWidget();
}