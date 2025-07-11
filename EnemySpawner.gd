extends Node2D

@export var enemy_scene: PackedScene

func spawn_enemies(count):
    for i in range(count):
        var enemy = enemy_scene.instantiate()
        enemy.position = Vector2(randf_range(100, 1180), randf_range(100, 620))
        enemy.add_to_group("enemies")
        add_child(enemy)