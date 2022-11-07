/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_grey);

draw_primitive_begin(pr_trianglestrip);
draw_vertex(0,0);
draw_vertex(250,0);
draw_vertex(0,60);
draw_vertex(200,60);
draw_primitive_end();

draw_set_color(c_white);
draw_text(100,30, "Initiative");

draw_set_color($333333);
for(var i=0; i<ds_list_size(initiativeList); i++){
	var unit = ds_list_find_value(initiativeList, i);
	draw_rectangle(220 + 100*i, 10, 300+100*i, 90, false);
	draw_sprite(unit.sprite_index, 0, 260+100*i, 80);
}


if(activeUnit != nil){
	draw_rectangle(room_width - 140, 30, room_width - 260, 70, false);
	draw_set_color(c_white);
	draw_text(room_width-200,50,"Actions: " + string(activeUnit.actions));
}
