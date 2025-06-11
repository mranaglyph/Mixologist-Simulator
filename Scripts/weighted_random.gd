class_name WR
extends RefCounted

## [b]OVERVIEW[/b]:[br]
## The weighted_random function is meant to give a 'weight' to rng.[br]
## This is useful if you are trying to create choices for the player or AI[br]
## that have an [b]UNEQUAL DISTRIBUTION[/b]. Say, you want something to happen[br]
## 5% of the time, but something else to happen 95% of the time, this would[br]
## be a good function to use. Typically, this would be used in combination with[br]
## the [color=salmon]match[/color] keyword in gdscript.[br]
## [br]
## [b]HOW TO[/b]:[br]
## The weighted_random function requires 3 parameters, 2 of which entered as an [color=Green]Array[/color].[br]
## The _names param is the array containing the choices which could be selected.[br]
## These are typically [color=Green]Strings[/color]. [i]ex: ["this", "that", "other"][/i][br]
## _weights is the array containing the likelihood each item will show up, say 45%,[br]
## 20%, etc. These should be [color=Green]floats[/color]. [i]ex: [.33, .33, .33][/i][br]
## The final param is _scale, which is an [color=Green]int[/color]. Specifically, it should be an[br]
## integer that when multiplied by each of the floats from the _weights param, yields[br]
## a [b]WHOLE[/b] number.[br]
## [i]Incorrect Example: _weights: [.25, .12, .003],   _scale = 100[/i][br]
## [i]Correct Example: _weights:   [.025, .012, .003], _scale = 1000[/i][br]
##[br]
## [b]FUNCTIONALITY[/b]:[br]
## The function itself is static, and could be referenced from anywhere in the game with[br]
## WR.weighted_random(). It generates a new extended array containing all the names[br]
## with their new adjusted weights. Then a choice is simply selected from the array.[br]
## The return value of the function is also an [color=Green]Array[/color]: [b]return_arr[/b].[br]
## [b]This returned array contains[/b]:[br]
##[i]----> The selected name from _names: return_arr[0][/i][br]
##[i]----> The new 'extended' array: return_arr[1][/i][br]
##[i]----> Another Array of sizes: return_arr[2][/i][br]
##-------> [b]The 'sizes' array contains[/b]:[br]
##[i]--------> The number of adjusted names per original element in '_names'[/i][br]
##[i]--------> The total size of the the 'extended' array[/i][br]
## Typically, you will probably only care about [b]return_arr[0][/b] and use that result[br]
## with the [color=salmon]match[/color] keyword for what ever purpose in your game.[br]
## [br]
## [b]FAIL STATES[/b]:[br]
## Aside from the previously mentioned issue to avoid incorrect scaling, the function[br]
## will fail if you enter incorrect types for the params. It will also likely fail[br]
## if you put more values in one array parameter than another. For best performance, you should[br] 
## likely use values in the _weights param that add to 1.0 (100%).[br]
## [br]
## [b]MISC[/b]:[br]
## Please take note that the array params are 1:1.[br]
## [i]Example: _names = ["this", "that"], _weights = [.25, .75], _scale = 100[/i][br]
## The above example will choose 'this' 25% of the time, and 'that' 75% of the time.[br]
## This means _weights[0] is applied to _names[0] and so on for all elements in both arrays.[br]
static func weighted_random(_names: Array, _weights: Array, _scale: int) -> Array:
	var final_choice_array = []
	var sizes = []
	
	var adjusted_weights = []
	for every_element in _weights:
		adjusted_weights.append(every_element * _scale)
	
	var counter = 0
	var index = 0
	while index < _names.size():
		for i in range(adjusted_weights[index]):
			final_choice_array.append(_names[index])
			counter += 1
		sizes.append(counter)
		counter = 0
		index += 1
	sizes.append(final_choice_array.size())
	
	var random_choice = final_choice_array.pick_random()
	var return_arr = [random_choice, final_choice_array, sizes]
	return return_arr
