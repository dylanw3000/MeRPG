/// @description Insert description here
// You can write your code in this editor

/*
switch(terrain){
	case terrainType.wall:
		draw_sprite(sWall,0, x,y);
		draw_sprite_ext(sWall, 0, x,y, image_xscale,image_yscale, image_angle, image_blend, image_alpha);
		break;
}
*/

if(debug){
	if(dist != nil){
		draw_set_color(c_black);
		draw_text(x,y, dist);
	}
	
	if(ds_list_size(units) > 0){
		draw_set_color(c_green);
		draw_text(x,y+20, ds_list_size(units));
	}
}
