extends Control

func _ready():
    var player = get_tree().get_first_node_in_group("player")
    player.item_collected.connect(_on_item_collected)

func _on_item_collected(item_type, amount):
    var label = get_node("Label_" + item_type)
    label.text = item_type.capitalize() + ": " + str(amount)