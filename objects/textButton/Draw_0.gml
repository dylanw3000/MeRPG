/// @description Insert description here
// You can write your code in this editor

draw_set_color($666666);
var inBox = false;
if(mouse_x > x-w && mouse_x < x+w && mouse_y > y-h && mouse_y < y+h){
	inBox = true;
	if(mouse_check_button_pressed(mb_left)){
		midclick = true;
	}
	
	if(!mouse_check_button(mb_left)){
		draw_set_color($bbbbbb);
	}
	else if(midclick){
		draw_set_color($333333);
	}
}
draw_rectangle(x-w,y-h, x+w,y+h, false);

if(mouse_check_button_released(mb_left)){
	if(inBox && midclick){
		triggered = true;
	}
	midclick = false;
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_text(x,y, text);
