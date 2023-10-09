extends Area2D

@export var speed = 700
var screen_size
var sizeX
var sizeY
var clampVector
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	sizeX = $Sprite2D.texture.get_width() * $Sprite2D.transform.get_scale().x * transform.get_scale().x
	sizeY = $Sprite2D.texture.get_height() * $Sprite2D.transform.get_scale().y * transform.get_scale().y
	clampVector = Vector2(sizeX/2, sizeY/2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("p2up"):
		velocity.y -= 1
	if Input.is_action_pressed("p2down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO + clampVector, screen_size - clampVector)

	pass
