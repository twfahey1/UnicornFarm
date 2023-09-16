extends Sprite2D

# Member variables
var speed = 200
var tomato_counter = 0  # Initialize the counter
@onready var tomato_counter_label = get_node("Label") # Adjust the path based on your actual node hierarchy
var TomatoMissle = preload("res://Scenes/shooting-object.tscn");



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):  # "ui_select" is the default action for spacebar
		print("Spacebar was pressed.")  # Log message to console
		shoot_tomato()

# Shoot a TomatoMissle
func shoot_tomato():
	print(TomatoMissle)
	if TomatoMissle:
		var tomato_instance = TomatoMissle.instance()  # Create a new instance of the TomatoMissle
	# 	tomato_instance.position = self.position  # Set its initial position to the Unicorn's position
		
	# 	# Optionally: Add any velocity or other properties to simulate shooting
	# 	tomato_instance.velocity = Vector2(200, 0)  # Example velocity, adjust as needed
		
	# 	get_parent().add_child(tomato_instance)  # Add the TomatoMissle to the parent scene
	# else:
	# 	print("No missle!")
# Update UI Label
func update_ui():
	# Console log the counter
	print(tomato_counter)
	tomato_counter_label.text = str(tomato_counter)

# Physics process for handling movement
func _physics_process(delta):
	var velocity = Vector2(0, 0)
	if Input.is_action_pressed("ui_right"):
		velocity.x += 100
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 100
	if Input.is_action_pressed("ui_down"):
		velocity.y += 100
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 100
	velocity = velocity.normalized() * speed * delta
	self.position += velocity

# Increment tomato counter
func increment_tomato_counter():
	tomato_counter += 1
	update_ui()

# Collision handling
func _on_Area2D_body_entered(body):
	if body.name == "TomatoMissle":
		body.queue_free()
		increment_tomato_counter()
