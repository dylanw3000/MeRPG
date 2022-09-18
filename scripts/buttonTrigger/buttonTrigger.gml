// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buttonTrigger(_button){
	switch(_button.action){
		case buttonAction.stride:
			substate = turnState.select;
			activeTile.moveTargeting(ds_list_find_value(initiativeList, initiativeCount).move);
			inputAllowed = inputType.move;
			break;
		case buttonAction.strike:
		default:
	}
}