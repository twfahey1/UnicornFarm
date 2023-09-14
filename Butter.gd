extends Sprite2D

var speed = 200

func _physics_process(delta):
	var velocity = Vector2(0, 0)

	if Input.is_action_pressed("ui_right"):
		velocity.x += 20
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 20
	if Input.is_action_pressed("ui_down"):
		velocity.y += 20
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 20

	velocity = velocity.normalized() * speed * delta
	self.position += velocity
