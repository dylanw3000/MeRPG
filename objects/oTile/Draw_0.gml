/// @description Insert description here
// You can write your code in this editor

depth = room_height-y;

image_blend = c_white;
if(gridCtrl.state != gameState.enemyTurn){
	if(dist != nil){
		image_blend = c_aqua;
	}
	if(hoverTile != nil && hoverTile.group != nil && group == hoverTile.group){
		image_blend = c_green;
	}
	if(activeTile == id){
		image_blend = c_blue;
	}
	if(hoverTile == id && (inputAllowed == inputType.target || inputAllowed == inputType.move)){
		image_blend = c_gray;
	}
}
// draw_sprite_ext(sprite_index, image_index, x,y, image_xscale,image_yscale, image_angle, image_blend, image_alpha);
draw_self();
