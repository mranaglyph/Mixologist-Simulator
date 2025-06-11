extends Node2D

@onready var npc_img_ref = $NPCImage
@onready var npc_emotion_ref = $NPCEmotion
@onready var viewport = get_viewport().size

const npc_body_scale = Vector2(.23, .23)
const emotion_adjusted = 25
var npc_emotion_scale = npc_body_scale

const npc_female = preload("res://Assets/pngs/npc/npc_female.png")
const npc_male = preload("res://Assets/pngs/npc/npc_male.png")

const emotion_happy = preload("res://Assets/pngs/npc/happy_mouth.png")
const emotion_neutral = preload("res://Assets/pngs/npc/neutral_mouth.png")
const emotion_mad = preload("res://Assets/pngs/npc/mad_mouth.png")
const emotion_sick = preload("res://Assets/pngs/npc/sick_mouth.png")


func spawn_npc(already_spawned):
	if !already_spawned:
		var gender = WR.weighted_random(["female", "male"], [.62, .38], 100)
		match (gender[0]):
			"female":
				npc_img_ref.texture = npc_female
		
				npc_img_ref.scale = npc_body_scale
				
				npc_img_ref.global_position.x = viewport.x * .75
				npc_img_ref.global_position.y = viewport.y / 2
				
				npc_emotion()
			"male":
				npc_img_ref.texture = npc_male
		
				npc_img_ref.scale = npc_body_scale
				
				npc_img_ref.global_position.x = viewport.x * .75
				npc_img_ref.global_position.y = viewport.y / 2
				
				npc_emotion()

func npc_emotion():
	var emotion = WR.weighted_random(["happy", "neutral", "mad", "sick"], [.65, .25, .09, .01], 100)
	match (emotion[0]):
		"happy":
			npc_emotion_ref.texture = emotion_happy
	
			npc_emotion_ref.scale = npc_emotion_scale
			
			npc_emotion_ref.global_position.x = viewport.x * .75
			npc_emotion_ref.global_position.y = (viewport.y / 2) + emotion_adjusted
		"neutral":
			npc_emotion_ref.texture = emotion_neutral
	
			npc_emotion_ref.scale = npc_emotion_scale
			
			npc_emotion_ref.global_position.x = viewport.x * .75
			npc_emotion_ref.global_position.y = (viewport.y / 2) + emotion_adjusted
		"mad":
			npc_emotion_ref.texture = emotion_mad
	
			npc_emotion_ref.scale = npc_emotion_scale
			
			npc_emotion_ref.global_position.x = viewport.x * .75
			npc_emotion_ref.global_position.y = (viewport.y / 2) + emotion_adjusted
		"sick":
			npc_emotion_ref.texture = emotion_sick
	
			npc_emotion_ref.scale = npc_emotion_scale
			
			npc_emotion_ref.global_position.x = viewport.x * .75
			npc_emotion_ref.global_position.y = (viewport.y / 2) + emotion_adjusted
	
