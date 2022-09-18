/// @description Insert description here
// You can write your code in this editor

if(dist == nil){return;}

switch(inputAllowed){
	case inputType.move:
		activeUnit.actorMove(id);
		break;
	case nil:
}

/*
if(inputAllowed == inputType.freeSelect){
	inputAllowed = inputType.targeting;
	activeTile = id;

	lineTargeting(6);
}
else if(inputAllowed = inputType.targeting && activeTile == id){
	with(oTile){
		dist = nil;
		group = nil;
	}
	activeTile.moveTargeting(4);
}
*/
