extends Node2D
const ballFile = preload("res://ball.tscn")
var ball
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	
	var p1 = $Player
	var p2 = $Player2
	
	var p1ySize = p1.get_node("Sprite2D").texture.get_height() * p1.get_node("Sprite2D").transform.get_scale().y * p1.transform.get_scale().y
	var p1xSize = p1.get_node("Sprite2D").texture.get_width() * p1.get_node("Sprite2D").transform.get_scale().x * p1.transform.get_scale().x
	var p2ySize = p2.get_node("Sprite2D").texture.get_height() * p2.get_node("Sprite2D").transform.get_scale().y * p2.transform.get_scale().y
	var p2xSize = p2.get_node("Sprite2D").texture.get_width() * p2.get_node("Sprite2D").transform.get_scale().x * p2.transform.get_scale().x

	ball = ballFile.instantiate()
	add_child(ball)
	ball.pointP1.connect(_on_pointP1)
	ball.pointP2.connect(_on_pointP2)
	
	ball.transform.origin = Vector2(screen_size.x/2, screen_size.y/2)
	p1.transform.origin = Vector2(p1xSize/2 + 20, screen_size.y/2)
	p2.transform.origin = Vector2(screen_size.x - p2xSize/2 - 20, screen_size.y/2)	
	
	pass # Replace with function body.
	
func _on_pointP1():
	print("p1 scored")
	setupBall()
	pass # Replace with function body.


func _on_pointP2():
	print("p2 scored")
	setupBall()
	pass # Replace with function body.

func setupBall():
	ball.queue_free()
	ball = ballFile.instantiate()
	add_child(ball)
	ball.pointP1.connect(_on_pointP1)
	ball.pointP2.connect(_on_pointP2)
	ball.transform.origin = Vector2(screen_size.x/2, screen_size.y/2)
	print(ball.transform.origin)
