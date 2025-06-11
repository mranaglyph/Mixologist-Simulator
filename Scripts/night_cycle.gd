class_name Nights
extends RefCounted

enum worknight {
Tuesday = 0, 
Wednesday = 1,
Thursday = 2,
Friday = 3,
Saturday = 4
}

static var tonight = worknight.Tuesday

static func night():
	match (tonight):
		worknight.Tuesday:
			return "Tuesday"
			
		worknight.Wednesday:
			return "Wednesday"
			
		worknight.Thursday:
			return "Thursday"
			
		worknight.Friday:
			return "Friday"
			
		worknight.Saturday:
			return "Saturday"
