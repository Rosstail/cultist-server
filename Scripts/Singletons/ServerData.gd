extends Node

var deck_data
var village_data
var homes = {
	"tavern": Vector2(850, 300),
	"pontoon": Vector2(1100, 1500),
	"farm": Vector2(250, 530),
	"mill": Vector2(2950, 1500),
	"warehouse": Vector2(2375, 375),
	"shop": Vector2(3200, 925)
}

func _ready():
	deck_data = Deck.new()
	village_data = Village.new()
	pass
