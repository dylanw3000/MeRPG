/// @description Insert description here
// You can write your code in this editor

if(buttonPlay.triggered){
	instance_create_depth(900,500, 0, textButton);
	buttonPlay.triggered = false;
	
	room_goto(1);
}
