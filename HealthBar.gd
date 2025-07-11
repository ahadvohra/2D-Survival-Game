extends Control

func _ready():
    var player = get_tree().get_first_node_in_group("player")
    player.health_changed.connect(_on_health_changed)

func _on_health_changed(new_health):
    $ProgressBar.value = new_health