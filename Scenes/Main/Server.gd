extends Node
var network = NetworkedMultiplayerENet.new() #Create a new multiplayer network
var port = 25565 #Port used for connexion
var max_players = 2 #Maximum players allowed


func _ready(): #When the scene is ready
	StartServer()


func StartServer(): #Starts the server
	network.create_server(port, max_players)
	get_tree().set_network_peer(network)
	print("Server started")
	
	
	#Connect events
	network.connect("peer_connected", self, "_Peer_Connected")
	network.connect("peer_disconnected", self, "_Peer_Disconnected")


func _Peer_Connected(player_id): #Upon player is connected
	print("User " + str(player_id) + " Connected.")


func _Peer_Disconnected(player_id): #Upon player is disconnected
	print("User " + str(player_id) + " Disconnected.")
