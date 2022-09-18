/// @description Insert description here
// You can write your code in this editor

var _unit;
switch(state){
	case gameState.setup:
		initiativeCount = 0;
		_unit = ds_list_find_value(initiativeList, initiativeCount);
		activeTile = _unit.tile;
		activeUnit = _unit;
		if(object_get_parent(_unit.object_index) == oPlayer){
			state = gameState.playerTurn;
		}
		else if(object_get_parent(_unit.object_index) == oEnemy){
			state = gameState.enemyTurn;
		}
		else{
			makeTextButton(400,400, 50,50, "undefined state");
			state = gameState.betweenTurn;
		}
		break;
	case gameState.playerTurn:
		switch(substate){
			case nil:
				var _button = makeTextButton(room_width-70,50, 60,20, "Stride");
				_button.action = buttonAction.stride;
				ds_list_add(playerButtons, _button);
				substate = turnState.buttons;
				
			case turnState.buttons:
				for(var i=0; i<ds_list_size(playerButtons); i++){
					var _button = ds_list_find_value(playerButtons, i);
					if(_button.triggered){
						buttonTrigger(_button);
						/*
						substate = turnState.select;
						activeTile.moveTargeting(ds_list_find_value(initiativeList, initiativeCount).move);
						inputAllowed = inputType.move;
						*/
						while(ds_list_size(playerButtons) > 0){
							instance_destroy(ds_list_find_value(playerButtons,0));
							ds_list_delete(playerButtons, 0);
						}
					}
				}
				break;
		}
		break;
}
