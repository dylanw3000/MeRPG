/// @description Insert description here
// You can write your code in this editor

enum terrainType{
	wall
}

tile = nil;
type = nil;

sprite_index = sWall;

function setTerrain(_type){
	type = _type;
	switch(_type){
		case terrainType.wall:
			sprite_index = sWall;
			break;
		default:
			sprite_index = sError;
			break;
	}
}
