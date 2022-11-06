/// @description Insert description here
// You can write your code in this editor

// left, up-left, up-right, right, down-right, down-left
neighbors = [nil, nil, nil, nil, nil, nil];
// hovered = false;

gridx = nil;
gridy = nil;

cost = 1;
dist = nil;

group = nil;

image_xscale = 0.75;
image_yscale = 0.75;

units = ds_list_create();
terrain = false;

path_prev = nil;

function tileClear(){
	with(oTile){
		dist = nil;
		group = nil;
		path_prev = nil;
	}
}

function moveTargeting(range){
	var moveBreakdown = range + cost;
	dist = range;
	var neighborPath = [nil,nil,nil,nil,nil,nil];
	
	for(var i=0; i<6; i++){
		var tile = neighbors[i];
		if(tile == nil) { continue; }
		
		if(tile.dist < dist-tile.cost && dist-tile.cost >= 0){
			tile.dist = dist-tile.cost;
			neighborPath[i] = 1;
			// tile.color = c_aqua;
			tile.path_prev = id;
			if(tile.dist > moveBreakdown) return;
		}
	}
	
	for(var i=0; i<6; i++){
		if(neighborPath[i] != nil){
			with(neighbors[i]){
				moveTargeting(dist);
			}
		}
	}
}

function enemyMoveTargeting(){
	var moveBreakdown = dist - cost;
	var neighborPath = [nil,nil,nil,nil,nil,nil];
	
	for(var i=0; i<6; i++){
		var tile = neighbors[i];
		if(tile == nil) { continue; }
		
		if(tile.dist == nil || tile.dist > dist+tile.cost){
			tile.dist = dist+tile.cost;
			neighborPath[i] = 1;
			tile.path_prev = id;
			if(tile.dist < moveBreakdown) return;
		}
	}
	
	for(var i=0; i<6; i++){
		if(neighborPath[i] != nil){
			with(neighbors[i]){
				enemyMoveTargeting();
			}
		}
	}
}

function freeTargeting(range){
	//
	// gridCtrl.gridData[0][5].y += 100;
	// activeTile.dist = 1;
	for(var i=0; i<gridCtrl.gridWidth; i++){
		for(var j=0; j<gridCtrl.gridHeight; j++){
			if(j%2 == activeTile.gridy%2){
				if(abs(j-activeTile.gridy) <= range){
					if(abs(i-activeTile.gridx) + (abs(j-activeTile.gridy) / 2) <= range){
						gridCtrl.gridData[i][j].dist = 1;
					}
				}
			}
			else{
				if(abs(j-activeTile.gridy) <= range){
					if(abs(i-activeTile.gridx) + (abs(j-activeTile.gridy) / 2) <= range){
						gridCtrl.gridData[i][j].dist = 1;
					}
					// if((activeTile.gridy%2 && i > activeTile.gridx) || (!activeTile.gridy%2 && i < activeTile.gridx)){}
					if(activeTile.gridy%2 == 0){
						if(i < activeTile.gridx){
							if(activeTile.gridx-i-1 + (abs(j-activeTile.gridy) / 2) <= range){
								gridCtrl.gridData[i][j].dist = 1;
							}
						}
					}
					else{
						if(i > activeTile.gridx){
							if(i-1 - activeTile.gridx + (abs(j-activeTile.gridy) / 2) <= range){
								gridCtrl.gridData[i][j].dist = 1;
							}
						}
					}
				}
			}
		}
	}
}

function lineTargeting(range){
	if(range <= 0){ return; }
	
	dist = range;
	
	for(var i=0; i<6; i++){
		var tile = neighbors[i];
		if(tile == nil){ continue; }
		tile.dist = dist-1;
		// tile.color = c_aqua;
		tile.group = i;
		
		while(tile.dist > 0 && tile.neighbors[i] != nil){
			tile.neighbors[i].dist = tile.dist-1;
			tile = tile.neighbors[i];
			// tile.color = c_aqua;
			tile.group = i;
		}
		
	}
}

function setWall(){
	var wall = instance_create_depth(x,y, -y, oTerrain);
	terrain = true;
	cost = 99;
	wall.image_xscale = image_xscale;
	wall.image_yscale = image_yscale;
	wall.tile = id;
	wall.setTerrain(terrainType.wall);
	unit = wall;
}

function setUnit(_unitType){
	var _unit = instance_create_depth(x,y, -y, _unitType);
	ds_list_add(units, _unit);
	// unit = _unit;
	_unit.tile = id;
	return _unit;
}
