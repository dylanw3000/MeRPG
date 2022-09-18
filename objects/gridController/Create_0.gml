/// @description Insert description here
// You can write your code in this editor

globalvar gridCtrl;
gridCtrl = id;

enum inputType {
	freeSelect,
	move,
	targeting,
	none
}

enum gameState {
	setup,
	betweenTurn,
	playerTurn,
	enemyTurn
}
state = gameState.setup;
enum turnState {
	buttons,
	select,
	moving
}
substate = nil;
playerButtons = ds_list_create();

globalvar inputAllowed;
inputAllowed = inputType.none;

globalvar activeTile;
activeTile = nil;

globalvar activeUnit;
activeUnit = nil;

globalvar hoverTile;
hoverTile = nil;


initiativeList = ds_list_create();
initiativeCount = nil;

gridHeight = 16;
gridWidth = 20;

gridOffsetX = 50;
gridOffsetY = 120;

tileSize = 60;

gridData = 0;
for(var j=0; j<gridHeight; j++){
	for(var i=0; i<gridWidth; i++){
		// draw_circle(i*tileSize + (j%2 * tileSize/2), j*tileSize, tileSize/2, false);
		// multiply y by .66 once tiles are actually added
		gridData[i,j] = instance_create_depth(i*tileSize + (j%2 * tileSize/2) + gridOffsetX, j*tileSize*.66 + gridOffsetY, 0, oTile);
	}
}

for(var j=0; j<gridHeight; j++){
	for(var i=0; i<gridWidth; i++){
		var tile = gridData[i,j];
		
		if(i > 0){ tile.neighbors[0] = gridData[i-1,j]; }
		if(i < gridWidth-1){ tile.neighbors[3] = gridData[i+1,j]; }
		
		var oddRow = false;
		if(j%2 == 1){
			oddRow = true;
		}
		
		if(j > 0){
			if(oddRow){ tile.neighbors[1] = gridData[i,j-1]; }
			else if(i > 0){ tile.neighbors[1] = gridData[i-1,j-1]; }
			
			if(!oddRow){ tile.neighbors[2] = gridData[i,j-1]; }
			else if(i < gridWidth-1){ tile.neighbors[2] = gridData[i+1,j-1]; }
		}
		
		if(j < gridHeight-1){
			if(!oddRow){ tile.neighbors[4] = gridData[i,j+1]; }
			else if(i < gridWidth-1){ tile.neighbors[4] = gridData[i+1,j+1]; }
			
			if(oddRow){ tile.neighbors[5] = gridData[i,j+1]; }
			else if(i > 0){ tile.neighbors[5] = gridData[i-1,j+1]; }
		}
	}
}

gridData[4][4].setWall();
gridData[3][5].setWall();
gridData[3][6].setWall();

ds_list_add(initiativeList, gridData[6][7].setUnit(oWarrior));
ds_list_add(initiativeList, gridData[15][9].setUnit(oGoblin));

/*
activeTile = gridData[6][7];
activeTile.moveTargeting(4);
inputAllowed = inputType.move;
*/
