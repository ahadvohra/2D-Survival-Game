extends CharacterBody2D

var speed = 100
var health = 50

func _physics_process(delta):
    var player = get_tree().get_first_node_in_group("player")
    if player:
        var direction = (player.global_position - global_position).normalized()
        velocity = direction * speed
        move_and_slide()
        if global_position.distance_to(player.global_position) < 30:
            player.take_damage(10 * delta)

func take_damage(amount):
    health -= amount
    if health <= 0:
        queue_free()