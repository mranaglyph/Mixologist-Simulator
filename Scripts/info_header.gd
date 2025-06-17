extends Node

@onready var parser_ref = $"../../Parser"
@onready var night_ref = %NightLabel
@onready var time_ref = %TimeLabel
@onready var next_cust_ref = %NextCust
@onready var cust_helped_ref = %CustHelped
@onready var npc_gen_ref = $"../../BKGD/MarginContainer/HBox1/ImageDisplay/NPCGen"
@onready var npc_image_ref = npc_gen_ref.get_node("NPCImage")
@onready var main_ref = $"../.."
@onready var fps_ref = %FPS

const night_len_frames_total = 28800
const tue_night = 1300
const wed_night = 1225
const thr_night = 1150
const fri_night = 1075
const sat_night = 1000

var night = Nights.night()

var clock_time
var clock_text
var cust_clock = []
#var actual_clock = 1  #hard game clock speed, 8hr work day
var accel_clock  = 60  #soft game clock speed, 8min per day

var night_start = false
var time_flag   = false
var frames      = 0
var sec         = 0
var mnu         = 0
var hrs         = 6
var am_pm       = "pm"

var cust_waiting = false
var time_remaining_cust = 0

var night_name_var
var spawned_npc = false

func _ready():
	global.cust_helped = 0
	night_name_var = Nights.night()
	night_ref.text = "|N: %s|" % night_name_var

func _process(_delta):
	fps_ref.text = "|FPS: %s|" % str(int(Engine.get_frames_per_second()))
	
	if night_start && time_flag:
		var time = clock()
		time_ref.text = time[0]
		next_cust_ref.text = time[1][0]
		
		if time[1][1] && !spawned_npc:
			npc_gen_ref.spawn_npc(spawned_npc)
			
			var npc_info = npc_image_ref.drink_selection_and_dialog()
			var npc_dialog = "customer-request-bypass %s" % npc_info
			
			main_ref._on_input_text_submitted(npc_dialog)
			
			spawned_npc = true
			global.cust_spawned = true
			
		if parser_ref.cust_helped == true:
			global.drink_expected = ""
			global.drink_exp_ing = ""
			global.cust_spawned = false
			spawned_npc = false
			cust_waiting = false
			parser_ref.cust_helped = false
		
		cust_helped_ref.text = "|Helped: %s|" % global.cust_helped
		if hrs == 2 && am_pm == "am" && Nights.tonight != Nights.worknight.Saturday:
			main_ref._on_input_text_submitted("controller-request-scoreboard")
		elif hrs == 2 && am_pm == "am" && Nights.tonight == Nights.worknight.Saturday:
			main_ref._on_input_text_submitted("controller-request-scoreboard-final")

func clock():
	clock_time = accel_clock
	if parser_ref.manual_open || !night_start || (hrs == 2 && am_pm == "am"):
		time_flag = false
		clock_text = "|Time: Paused|"
		
		if cust_clock[0] != "|Cust Waiting|":
			cust_clock[0] = "|Cust In: Paused|"
		else:
			cust_clock[0] = "|Cust Waiting|"
		
		var return_arr = [clock_text, cust_clock]
		return return_arr
	else: 
		time_flag = true
		clock_text = work_clock(clock_time)
		cust_clock = get_next_cust_time()
		var return_arr = [clock_text, cust_clock]
		return return_arr
	
func work_clock(clock_time_param):
	if time_flag == true:
		frames += clock_time_param
		if frames % 60 == 0:
			frames = 0
			sec += 1
			if sec % 60 == 0:
				sec = 0
				mnu += 1
				if mnu % 60 == 0:
					mnu = 0
					hrs += 1
					if hrs == 12:
						am_pm = "am"
					if hrs > 12:
						hrs = 1
	
	if sec < 10  && mnu >= 10: return "|T: %d:%d:%s%d%s|"   % [hrs, mnu, "0", sec, am_pm]
	if sec >= 10 && mnu <  10: return "|T: %d:%s%d:%d%s|"   % [hrs, "0", mnu, sec, am_pm]
	if sec < 10  && mnu <  10: return "|T: %d:%s%d:%s%d%s|" % [hrs, "0", mnu, "0", sec, am_pm]
	if sec >= 10 && mnu >= 10: return "|T: %d:%d:%d%s|"     % [hrs, mnu, sec, am_pm]
	
func get_next_cust_time():
	var msg = ""
	match (night):
		"Tuesday":
			if !cust_waiting:
				if (time_remaining_cust < tue_night):
					msg = "|Cust: %ds|" % ((tue_night - time_remaining_cust) / 60)
					time_remaining_cust += 1
				elif (time_remaining_cust >= tue_night):
					cust_waiting = true
			else:
				msg = "|Cust Waiting|"
				time_remaining_cust = 0
				global.drink_timer += 1
		"Wednesday":
			if !cust_waiting:
				if (time_remaining_cust < wed_night):
					msg = "|Cust: %ds|" % ((wed_night - time_remaining_cust) / 60)
					time_remaining_cust += 1
				elif (time_remaining_cust >= wed_night):
					cust_waiting = true
			else:
				msg = "|Cust Waiting|"
				time_remaining_cust = 0
				global.drink_timer += 1
		"Thursday":
			if !cust_waiting:
				if (time_remaining_cust < thr_night):
					msg = "|Cust: %ds|" % ((thr_night - time_remaining_cust) / 60)
					time_remaining_cust += 1
				elif (time_remaining_cust >= thr_night):
					cust_waiting = true
			else:
				msg = "|Cust Waiting|"
				time_remaining_cust = 0
				global.drink_timer += 1
		"Friday":
			if !cust_waiting:
				if (time_remaining_cust < fri_night):
					msg = "|Cust: %ds|" % ((fri_night - time_remaining_cust) / 60)
					time_remaining_cust += 1
				elif (time_remaining_cust >= fri_night):
					cust_waiting = true
			else:
				msg = "|Cust Waiting|"
				time_remaining_cust = 0
				global.drink_timer += 1
		"Saturday":
			if !cust_waiting:
				if (time_remaining_cust < sat_night):
					msg = "|Cust: %ds|" % ((sat_night - time_remaining_cust) / 60)
					time_remaining_cust += 1
				elif (time_remaining_cust >= sat_night):
					cust_waiting = true
			else:
				msg = "|Cust Waiting|"
				time_remaining_cust = 0
				global.drink_timer += 1
			
	var info_arr = [msg, cust_waiting]
	return info_arr
