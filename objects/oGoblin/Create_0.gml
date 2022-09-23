/// @description Insert description here
// You can write your code in this editor

event_inherited();

hp_max = 2;
hp = hp_max;

function enemyBehavior() {
	activeTile.dist = 0;
	activeTile.enemyMoveTargeting();
	
	var targetPlayer = nil;
	for(var i=0; i<instance_number(oPlayer); i++){
		targetPlayer = instance_find(oPlayer, i);
		break;
	}
	
	if(targetPlayer == nil){
		substate = turnState.afterAction;
		return;
	}
	
	var targetTile = targetPlayer.tile.path_prev;
	while(targetTile.dist > move){
		targetTile = targetTile.path_prev;
	}
	
	for(var i=0; i<ds_list_size(activeTile.units); i++){
		if(ds_list_find_value(activeTile.units, i) == id){
			ds_list_delete(activeTile.units, i);
			break;
		}
	}
	tile = targetTile;
	ds_list_add(targetTile.units, id);
	activeTile = targetTile;
	
	x = tile.x; y = tile.y;
	
	gridCtrl.substate = turnState.afterAction;
}
