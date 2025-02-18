extends "res://entities/units/player/player.gd"

const RELEVANT_PLAYER_EFFECTS := ["consumable_stats_while_max", "temp_consumable_stats_while_max", "explode_on_consumable", "explode_on_consumable_burning","decaying_stats_on_consumable"]

func _on_ItemAttractArea_area_entered(item: Item) -> void:
	var has_relevant_effect := false
	for effect in RELEVANT_PLAYER_EFFECTS:
		if RunData.get_player_effect(effect, player_index):
			has_relevant_effect = true
	if not has_relevant_effect:
		return
	var item_already_attracted_by_player := item.attracted_by != null
	if not item_already_attracted_by_player:
		item.attracted_by = self
	if global_position.distance_squared_to(item.global_position) < global_position.distance_squared_to(item.attracted_by.global_position):
		item.attracted_by = self
