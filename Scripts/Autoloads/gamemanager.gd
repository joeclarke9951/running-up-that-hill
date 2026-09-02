extends Node

var spawn_point = Vector3(0,0.5,0)
var players:Array[Player] = []

func respawn(player:Player):
	if player:
		player.position = spawn_point
	player.health = 100

func get_player(index:int):
	return players[index]

func set_player(player:Player, index:int):
	if len(players) >= index + 1:	# replacing an entry
		players[index] = player
	else:							# adding a new entry
		players.append(player)

func get_player_count():
	return len(players)
