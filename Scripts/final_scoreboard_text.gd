extends RichTextLabel

var drink_timer_ref = 0
var drinks_made_ref = []
var cust_helped_ref = 0
var night_ref = Nights.night()
var night_score = "No Rank"

func _ready():
	drink_timer_ref = global.drink_timer
	drinks_made_ref = global.drinks_made
	cust_helped_ref = global.cust_helped
	
	var drinks_made_ref_text = ""
	for i in range(0, drinks_made_ref.size()):
		if i + 1 == drinks_made_ref.size():
			drinks_made_ref_text += drinks_made_ref[i]
		else:
			drinks_made_ref_text += drinks_made_ref[i] + ", "
			
	match (night_ref):
		"Tuesday":
			night_score = night_score_eval(global.cust_count_tue)
			global.final_score_tue = night_score
		"Wednesday":
			night_score = night_score_eval(global.cust_count_wed)
			global.final_score_wed = night_score
		"Thursday":
			night_score = night_score_eval(global.cust_count_thr)
			global.final_score_thr = night_score
		"Friday":
			night_score = night_score_eval(global.cust_count_fri)
			global.final_score_fri = night_score
		"Saturday":
			night_score = night_score_eval(global.cust_count_sat)
			global.final_score_sat = night_score
	
	var week = final_eval()
	text = "%s Scores: \nTotal Time Making Drinks: %s sec\nDrinks Made: %s\nTotal Customers Helped: %s\nNight Rank: %s\n\nWeek Score: %s / 60\nWeek Rank: %s" % [night_ref, drink_timer_ref / 60, drinks_made_ref_text, cust_helped_ref, night_score, week[0], week[1]]

func night_score_eval(cust_count_night) -> String:
	var night_score_ref = ""
	var percentage = float(cust_helped_ref) / float(cust_count_night)
	
	if percentage <= .5:
		night_score_ref = "D Rank"
	elif percentage > .5 && percentage <= .7:
		night_score_ref = "C Rank"
	elif percentage > .7 && percentage <= .9:
		night_score_ref = "B Rank"
	elif percentage > .9 && percentage <= 1.1:
		night_score_ref = "A Rank"
	elif percentage > 1.1:
		night_score_ref = "S Rank"
	
	return night_score_ref
	
func final_eval():
	var tue_score_ref = 0 
	var wed_score_ref = 0 
	var thr_score_ref = 0 
	var fri_score_ref = 0 
	var sat_score_ref = 0 
	var week_score_ref = 0 
	
	match (global.final_score_tue):
		"D Rank":
			tue_score_ref = 5
		"C Rank":
			tue_score_ref = 7
		"B Rank":
			tue_score_ref = 9
		"A Rank":
			tue_score_ref = 11
		"S Rank":
			tue_score_ref = 12
	
	match (global.final_score_wed):
		"D Rank":
			wed_score_ref = 5
		"C Rank":
			wed_score_ref = 7
		"B Rank":
			wed_score_ref = 9
		"A Rank":
			wed_score_ref = 11
		"S Rank":
			wed_score_ref = 12
			
	match (global.final_score_thr):
		"D Rank":
			thr_score_ref = 5
		"C Rank":
			thr_score_ref = 7
		"B Rank":
			thr_score_ref = 9
		"A Rank":
			thr_score_ref = 11
		"S Rank":
			thr_score_ref = 12
			
	match (global.final_score_fri):
		"D Rank":
			fri_score_ref = 5
		"C Rank":
			fri_score_ref = 7
		"B Rank":
			fri_score_ref = 9
		"A Rank":
			fri_score_ref = 11
		"S Rank":
			fri_score_ref = 12
			
	match (global.final_score_sat):
		"D Rank":
			sat_score_ref = 5
		"C Rank":
			sat_score_ref = 7
		"B Rank":
			sat_score_ref = 9
		"A Rank":
			sat_score_ref = 11
		"S Rank":
			sat_score_ref = 12
			
	week_score_ref = (tue_score_ref + wed_score_ref + thr_score_ref + fri_score_ref + sat_score_ref)
	var week_rank
	
	if week_score_ref / 5 <= 5:
		week_rank = "D Rank"
	elif week_score_ref / 5 > 5 && week_score_ref / 5 <= 7:
		week_rank = "C Rank"
	elif week_score_ref / 5 > 7 && week_score_ref / 5 <= 9:
		week_rank = "B Rank"
	elif week_score_ref / 5 > 9 && week_score_ref / 5 <= 11:
		week_rank = "A Rank"
	elif week_score_ref / 5 > 11:
		week_rank = "S Rank"
		
	var week_scores_arr = [week_score_ref, week_rank]
	return week_scores_arr
