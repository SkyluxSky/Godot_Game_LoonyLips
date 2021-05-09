extends Control

#Global Variable - To be used in multiple functions
var player_words = []
#Array of dictionaries
#var template = [
#		{
#		"prompts" : ["a Name", "a noun", "adverb", "adjective"],
#		"story" : "Once upon a time, someone called %s ate a %s flavored sandwich which made them feel all %s inside. It was a %s day!"  
#		},
#		{
#		"prompts" : ["a Name", "a 4chan board", "something you would post on 4chan", "an emotion"],
#		"story" : "There once was an Anon named %s, their favorite board on 4chan was %s. Everyday, Anon would post %s to %s other users of the website."
#		},
#		{
#		"prompts" : ["a Name", "a 4chan board", "something you would post on 4chan", "an emotion"],
#		"story" : "There once was an Anon named %s, their favorite board on 4chan was %s. Everyday, Anon would post %s to %s other users of the website."
#		}
#		]

#Create an empty dictionary
var current_story = {}

#onready keyword allows us to store node locations in a variable.
onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
onready var ButtonLabel = $VBoxContainer/HBoxContainer/Label

"""Main Function"""

func _ready():
	set_current_story()
	DisplayText.text = "Welcome to Looney Lips -> "
	check_player_words_length()
	#prioritizes the text box
	PlayerText.grab_focus()
	
	
	# %s - utilizes strings based on created array 
	# print(story % prompts) == modulo operator schecking every index of the array 
	#print(story % prompts)
	
	#story and prompts require the same number of arguments.
	#prompts = ["Automobile", "Transported People", "20", "Prius"]
	#var nextStory = "Once upon a time someone built an %s that %s. %s years later, everyone owned an %s."
	#print(nextStory % prompts)
	
	#prompts = ["Economy", "Screwed People", "5", "Computer Science Degree!"]
	#print(nextStory % prompts)
	
	#RichTextLabel Node allows for bold and italic texts.
	
	#get_node("Label").text = "This is some text!"
	#Alternate way to modify strings.
	#changes the output of a child node.
	#prompts = ["Hank", "King Of The Hill", "Darndest"]
	

func set_current_story():
	randomize() #Init random number - shuffles numbers
	var stories = $StoryBook.get_child_count() # gets size of Storybook children.
	var selected_story = randi() % stories
	#current story == dictionary -add a key called prompts
	current_story.prompts = $StoryBook.get_child(selected_story).prompts
	current_story.story = $StoryBook.get_child(selected_story).story
	#picks random story by size of template.
	#current_story = template[randi() % template.size()]
	

"""Buttons and Enter_Key"""

#Signals add methods/functions to primary script.
#whatever variable is in the parameter of a function is automatically declared.
func _on_PlayerText_text_entered(new_text):	
	#we can pass arguments through multiple functions
	#update_DisplayText(new_text)
	add_to_player_words()


#buttonpress update
func _on_TextureButton_pressed():
	#Create new variable for player text
	#var words = PlayerText.text
	#update_DisplayText(words)
	if is_story_done():
		get_tree().reload_current_scene()
	else:	
		add_to_player_words()


#Updates Display Text
#Allows for cleaner code when working with signal based functions.
#All passed arguments in new functions can be renamed
#func update_DisplayText(words):
	#DisplayText.text = words
	#Clear allows (Clear of current text on enter box)
	#PlayerText.clear()
	

"""General Functions"""

func add_to_player_words():
	#adds element to end of an array
	player_words.append(PlayerText.text)
	#clears DisplayText
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()


func is_story_done():
	#returns true or false based on how many items are in the player_word array as there are in the prompts array.
	return player_words.size() == current_story.prompts.size()


func check_player_words_length():
	#if-elif-else statement
	if is_story_done():
		end_game()
	else:
		prompt_player()


func tell_story():
	DisplayText.text = current_story.story % player_words


func prompt_player():
	#use size of player words array to determine the position in the prompts array.
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"


func end_game():
	#queue free removes the function from the memory - Freeing PlayerText.
	#Removes functionality of a node.
	PlayerText.queue_free()
	ButtonLabel.text = "Again?"
	tell_story()


"""Other Notes"""
#Dictionaries - Good for inventory management.
#my_dictionary = {key:value, key:value, ...}








