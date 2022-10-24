/// @description Insert description here
// You can write your code in this editor

event_inherited();

hp_max = 2;
hp = hp_max;

function enemyBehavior() {
	if(path_index) return;
	
	activeTile.dist = 0;
	activeTile.enemyMoveTargeting();
	
	var targetPlayer = nil;
	for(var i=0; i<instance_number(oPlayer); i++){
		// change when there are multiple players
		targetPlayer = instance_find(oPlayer, i);
		break;
	}
	
	if(targetPlayer == nil){
		substate = turnState.afterAction;
		return;
	}
	
	var targetTile = targetPlayer.tile.path_prev;
	// while(targetTile.dist > move * actions){
	while(targetTile.dist > move){
		// need to find a way to path around all sides of the player
		targetTile = targetTile.path_prev;
	}
	/*
	while(targetTile.dist > move){
		actions--;
		targetTile.dist -= move;
	}
	*/
	
	/*
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
	*/
	
	actorMove(targetTile);
}
