extends Node

func FetchCardEffect(card_id):
	var effect = ServerData.deck_data.deck[card_id].display
	return effect
