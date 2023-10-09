extends Area2D
signal pointP1
signal pointP2
@export var speed = 500
var sizeX
var sizeY
var clampVector
var screen_size
var velocity
@export var maxSpeed = 1400
var angleChange
var dist

func _on_area_entered(area):
	velocity.x *= -1
	dist = (transform.get_origin().y - area.transform.get_origin().y)
	angleChange = 1 + abs(.005 * dist)
	velocity.y *= angleChange
	if speed < maxSpeed:
		speed += 160
	elif speed > maxSpeed:
		speed = maxSpeed

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	transform.origin = Vector2(screen_size.x/2, screen_size.y/2)
	sizeX = $Sprite2D.texture.get_width() * $Sprite2D.transform.get_scale().x * transform.get_scale().x
	sizeY = $Sprite2D.texture.get_height() * $Sprite2D.transform.get_scale().y * transform.get_scale().y
	clampVector = Vector2(sizeX/2, sizeY/2)
	
	velocity = Vector2(1, 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	
	if position.y >= screen_size.y - clampVector.y:
		velocity.y *= -1
	if position.y <= clampVector.y:
		velocity.y *= -1
		
	if position.x <= 15:
		print("hey??")
		pointP2.emit()
	if position.x >= screen_size.x - 15:
		print("hey??")
		pointP1.emit()
	pass
