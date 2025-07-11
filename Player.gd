extends CharacterBody2D

var speed = 200
var health = 100
var inventory = {"wood": 0, "food": 0}
signal health_changed(new_health)
signal item_collected(item_type, amount)

func _physics_process(delta):
    var input = Vector2(
        Input.get_axis("ui_left", "ui_right"),
        Input.get_axis("ui_up", "ui_down")
    ).normalized()
    velocity = input * speed
    move_and_slide()

    if Input.is_action_just_pressed("attack"):
        attack()

func attack():
    var enemies = get_tree().get_nodes_in_group("enemies")
    for enemy in enemies:
        if global_position.distance_to(enemy.global_position) < 50:
            enemy.take_damage(20)

func take_damage(amount):
    health -= amount
    health = clamp(health, 0, 100)
    emit_signal("health_changed", health)

func collect_item(item_type):
    inventory[item_type] += 1
    emit_signal("item_collected", item_type, inventory[item_type])