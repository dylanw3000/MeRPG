/// @description Insert description here
// You can write your code in this editor

event_inherited();

hp_max = 24;
hp = hp_max;

totalActions = 3;

ds_list_add(actionButtons, ["Move", buttonAction.stride, nil]);
ds_list_add(actionButtons, ["Strike", buttonAction.strike, 1]);
