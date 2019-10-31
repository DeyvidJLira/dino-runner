extends Control

func update_distance(value):
	$Margin/Container/lbDistance.text = "Distance: " + str(value) + " m"

func update_distance_max(value):
	$Margin/Container/lbDistanceHighscore.text = "Distance Máx: " + str(value) + " m"