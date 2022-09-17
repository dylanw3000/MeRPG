/// @description Insert description here
// You can write your code in this editor

depth = -room_height;

if(hoverTile != nil && hoverTile.path_prev != nil){
	var currentTile = hoverTile;
	var nextTile = hoverTile.path_prev;
	draw_set_color(c_yellow);
	
	while(nextTile != nil){
		draw_line_width(currentTile.x, currentTile.y, nextTile.x, nextTile.y, 3);
		currentTile = nextTile;
		nextTile = nextTile.path_prev;
	}
}
