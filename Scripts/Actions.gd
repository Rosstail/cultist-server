extends Node

var rng = RandomNumberGenerator.new()

func FetchCardEffect(card_id):
	var effect = ServerData.deck_data.deck[card_id].display
	return effect

func GenerateVeteranCard():
	var ids = []
	while ServerData.deck_data.main_veteran.size() < 5:
		var i = rng.randi_range(0, ServerData.deck_data.deck.size())
		if !ids.has(i):
			ids.append(i)
			ServerData.deck_data.main_veteran.append(ServerData.deck_data.deck[i])
			print(i)
		print("Added card to veteran")
	for card in ServerData.deck_data.main_veteran:
		print(card)
		ServerData.deck_data.deck.erase(card)
		
func GenerateNewcomerCard():
	var ids = []
	while ServerData.deck_data.main_newcomer.size() < 5:
		var i = rng.randi_range(0, ServerData.deck_data.deck.size())
		if !ids.has(i):
			ids.append(i)
			ServerData.deck_data.main_newcomer.append(ServerData.deck_data.deck[i])
			print(i)
		print("Added card to newcomer")
	for card in ServerData.deck_data.main_newcomer:
		print(card)
		ServerData.deck_data.deck.erase(card)
