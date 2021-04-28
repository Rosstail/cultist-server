extends Node
var network = NetworkedMultiplayerENet.new() #Create a new multiplayer network
var port = 25565 #Port used for connexion
var max_players = 2 #Maximum players allowed

var rng = RandomNumberGenerator.new()

func _ready(): #When the scene is ready
	StartServer()
	
	#TO MOVE
	var nav = $Node2D/Village/Navigation2D
	#for villager in ServerData.village_data.villagers:
		#print(villager.npc_name)
		#nav.add_child(villager)


func StartServer(): #Starts the server
	network.create_server(port, max_players)
	get_tree().set_network_peer(network)
	print("Server started !")
	
	
	#Connect events
	network.connect("peer_connected", self, "_Peer_Connected")
	network.connect("peer_disconnected", self, "_Peer_Disconnected")


func _Peer_Connected(player_id): #Upon player is connected
	print("User " + str(player_id) + " Connected.")


func _Peer_Disconnected(player_id): #Upon player is disconnected
	print("User " + str(player_id) + " Disconnected.")

remote func FetchCardEffect(card_id, requester):
	var player_id = get_tree().get_rpc_sender_id()
	var effect = Actions.FetchCardEffect(card_id)
	rpc_id(player_id, "ReturnEffect", effect, requester)
