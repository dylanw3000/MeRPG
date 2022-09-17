// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function makeTextButton(_x,_y, _w,_h, _text){
	var button = instance_create_depth(_x,_y, -room_height, oButton);
	button.h = _h;
	button.w = _w;
	button.text = _text;
	button.type = buttonType.text;
	return button;
}

function makeTextImageButton(_x,_y, _w,_h, _text, _image){
	var button = instance_create_depth(_x,_y, -room_height, oButton);
	button.h = _h;
	button.w = _w;
	button.text = _text;
	button.type = buttonType.textImage;
	button.image = _image;
	return button;
}
