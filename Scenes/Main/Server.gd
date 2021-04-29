extends Node

var network = NetworkedMultiplayerENet.new() #Create a new multiplayer network
var port = 25565 #Port used for connexion
var max_players = 2 #Maximum players allowed

var rng = RandomNumberGenerator.new()

func _ready(): #When the scene is ready
	var scene_spawner = Scene_Spawner.new()
	var get_nav = get_node("./Node2D/Navigation2D")
	for villager in scene_spawner.array_villagers:
		get_nav.add_child(villager)
	
	StartServer()
	#TO MOVE
#	var nav = $Node2D/Village/Navigation2D
#	for villager in ServerData.village_data.villagers:
#		print(villager.npc_name)
#		nav.add_child(villager)


func StartServer(): #Starts the server
	network.create_server(port, max_players)
	get_tree().set_network_peer(network)
	print("Server started !")
	
	
	#Connect events
	network.connect("peer_connected", self, "_Peer_Connected")
	network.connect("peer_disconnected", self, "_Peer_Disconnected")


func _Peer_Connected(player_id): #Upon player is connected
	print("User " + str(player_id) + " Connected.")
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


func _Peer_Disconnected(player_id): #Upon player is disconnected
	print("User " + str(player_id) + " Disconnected.")

remote func FetchCardEffect(card_id, requester):
	var player_id = get_tree().get_rpc_sender_id()
	var effect = Actions.FetchCardEffect(card_id)
	rpc_id(player_id, "ReturnEffect", effect, requester)
