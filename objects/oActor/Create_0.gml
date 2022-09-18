/// @description Insert description here
// You can write your code in this editor

hp_max = 1;
hp = hp_max;

totalAc = 3;
ac = totalAc;

totalActions = 2;
actions = totalActions;

totalMove = 4;
move = totalMove;

movePath = nil;

tile = nil;

// This requires pathfinding to already be active
function actorMove(_target){
	var _tilePath = ds_list_create();
	var _tile = _target;
	
	while(_tile.path_prev != nil){
		ds_list_add(_tilePath, _tile);
		_tile = _tile.path_prev;
	}
	
	if(path_exists(movePath)){
		path_delete(movePath);
	}
	movePath = path_add();
	path_set_closed(movePath, false);
	// _tile = activeTile;
	// var _tile = _target;
	path_add_point(movePath, activeTile.x, activeTile.y, 100);
	
	while(ds_list_size(_tilePath) > 0){
		_tile = ds_list_find_value(_tilePath, ds_list_size(_tilePath)-1);
		path_add_point(movePath, _tile.x, _tile.y, 100);
		ds_list_delete(_tilePath, ds_list_size(_tilePath)-1);
	}
	// path_add_point(movePath, activeTile.x, activeTile.y, 1);
	
	path_start(movePath, 4, path_action_stop, 1);
}
