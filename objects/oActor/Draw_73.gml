/// @description Insert description here
// You can write your code in this editor

depth = -y;

draw_set_color(c_gray);
draw_rectangle(x-30, y+6, x+30, y+10, false);

if(hp > 0){
	draw_set_color($33ff33);
	draw_rectangle(x-30, y+6, x-30 + 60*(hp/hp_max), y+10, false);
}
