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

movePath = path_add();

actionButtons = ds_list_create();

tile = nil;

// This requires pathfinding to already be active, and must be called within an Actor
function actorMove(_target){
	var _tilePath = ds_list_create();
	var _tile = _target;
	
	while(_tile.path_prev != nil){
		ds_list_add(_tilePath, _tile);
		_tile = _tile.path_prev;
	}
	
	path_end();
	path_clear_points(movePath);
	path_set_closed(movePath, false);
	// _tile = activeTile;
	// var _tile = _target;
	path_add_point(movePath, activeTile.x, activeTile.y, 100);
	
	while(ds_list_size(_tilePath) > 0){
		_tile = ds_list_find_value(_tilePath, ds_list_size(_tilePath)-1);
		path_add_point(movePath, _tile.x, _tile.y, 100);
		ds_list_delete(_tilePath, ds_list_size(_tilePath)-1);
	}
	ds_list_destroy(_tilePath);
	// path_add_point(movePath, activeTile.x, activeTile.y, 1);
	
	path_start(movePath, 4, path_action_stop, 1);
	
	// activeTile.tileClear();
	for(var i=0; i<ds_list_size(activeTile.units); i++){
		if(ds_list_find_value(activeTile.units, i) == id){
			ds_list_delete(activeTile.units, i);
			break;
		}
	}
	tile = _target;
	ds_list_add(_target.units, id);
	activeTile = _target;
	gridCtrl.substate = turnState.afterAction;
	inputAllowed = inputType.none;
}

function actorAttack(_targetTile){
	if(ds_list_size(_targetTile.units) == 0) { return; }
	
	for(var i=0; i<ds_list_size(_targetTile.units); i++){
		var _unit = ds_list_find_value(_targetTile.units, i);
		_unit.hp -= 1;
	}
	gridCtrl.substate = turnState.afterAction;
	inputAllowed = inputType.none;
}
