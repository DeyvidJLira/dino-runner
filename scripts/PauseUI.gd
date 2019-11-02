extends Control

func _on_btnContinue_button_down():
	get_tree().paused = false
	visible = false

func _on_btnQuit_button_down():
	get_tree().quit()
