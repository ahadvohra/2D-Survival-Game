extends Node2D

@export var collectible_scene: PackedScene

func spawn_collectibles(count):
    for i in range(count):
        var collectible = collectible_scene.instantiate()
        collectible.position = Vector2(randf_range(100, 1180), randf_range(100, 620))
        add_child(collectible)