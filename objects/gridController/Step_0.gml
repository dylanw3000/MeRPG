/// @description Insert description here
// You can write your code in this editor

if(substate == turnState.afterAction){
	substate = nil;
	activeUnit.actions--;
	activeTile.tileClear();
	inputAllowed = inputType.none;
	if(activeUnit.actions <= 0){
		state = gameState.betweenTurn;
		initiativeCount++;
		if(initiativeCount >= ds_list_size(initiativeList)){
			initiativeCount = 0;
		}
	}
}

var _unit;
switch(state){
	case gameState.setup:
		initiativeCount = 0;
	case gameState.betweenTurn:
		_unit = ds_list_find_value(initiativeList, initiativeCount);
		activeTile = _unit.tile;
		activeUnit = _unit;
		_unit.actions = _unit.totalActions;
		
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
		if(mouse_check_button_pressed(mb_right)) {
			activeTile.tileClear();
			inputAllowed = inputType.none;
			substate = nil;
		}

		switch(substate){
			case nil:
				if(ds_list_size(activeUnit.actionButtons) == 0){
					makeTextButton(room_width/2,room_height/2, 60,20, "NO ACTIONS ASSIGNED\nTO ACTIVE UNIT")
				}
				
				for(var i=0; i<ds_list_size(activeUnit.actionButtons); i++){
					var _actionInfo = ds_list_find_value(activeUnit.actionButtons, i);
					var _button = makeTextButton(room_width-70,50 + 50*i, 60,20, _actionInfo[0]);
					_button.action = _actionInfo[1];
					_button.triggerKey = ord(chr(i+49));
					ds_list_add(playerButtons, _button);
				}
				
				substate = turnState.buttons;
				break;
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
	case gameState.enemyTurn:
		activeUnit.enemyBehavior();
		// substate = turnState.afterAction;
		break;
}
