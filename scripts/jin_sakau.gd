extends CharacterBody2D

const speed = 100
var current_direction = "none"

func _ready():
	$AnimatedSprite2D.play("f_idle")

func _physics_process(delta):
	jin_sakau_movement(delta)

func jin_sakau_movement(delta):
	if Input.is_key_pressed(KEY_D):
		current_direction = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
		
	elif Input.is_key_pressed(KEY_A):
		current_direction = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
		
	elif Input.is_key_pressed(KEY_S):
		current_direction = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
		
	elif Input.is_key_pressed(KEY_W):
		current_direction = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	
func play_anim(movement):
	var dir = current_direction
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("r_walk")
		elif movement == 0:
			anim.play("r_idle")
			
	if dir == "left":
		anim.flip_h = false
		if movement == 1:
			anim.play("l_walk")
		elif movement == 0:
			anim.play("l_idle")
			
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("f_walk")
		elif movement == 0:
			anim.play("f_idle")
			
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("b_walk")
		elif movement == 0:
			anim.play("b_idle")
