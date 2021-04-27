extends Node

class_name Deck

var deck = []
var discard = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	var deck_data_file = File.new()
	deck_data_file.open("res://Data/deck.json", File.READ)
	var deck_data_json = JSON.parse(deck_data_file.get_as_text())
	deck_data_file.close()
	var deck_data = deck_data_json.result
	var cards = deck_data["cards"][0]
	
	var id = 0
	var types = ["kill", "convert", "threat"]
	for type in types:
		for i in cards[type]["amount"]:
			if type == "kill":
				deck.append(Card_Kill.new(id, cards[type]))
			if type == "convert":
				deck.append(Card_Convert.new(id, cards[type]))
			if type == "threat":
				deck.append(Card_Threat.new(id, cards[type]))
			id = id + 1
	print(str(deck.size()) + " cards generated from json")
