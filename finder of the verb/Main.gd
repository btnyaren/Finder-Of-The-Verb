extends Control

var verb1 = FileAccess.open("res://verb1.txt", FileAccess.READ)
var verb2 = FileAccess.open("res://verb2.txt", FileAccess.READ)
var verb3 = FileAccess.open("res://verb3.txt", FileAccess.READ)

var verb1_list = []
var verb2_list = []
var verb3_list = []

var i1 = 0
var i2 = 0
var i3 = 0


var verb1_dict = {}
var verb2_dict = {}
var verb3_dict = {}

var search_word


func _ready():
	
	$result.hide()
	$info.hide()
	
	
	
		
		
	setVerb1()
	setVerb2()
	setVerb3()
	
	
	
		
	
	
	
	
	
		
	
	
	print(verb2_dict)
	
	
	

func setVerb1():
	while i1 <=  1000:
		verb1_list.append(verb1.get_line())
		var last = verb1_list.back()
		
		verb1_dict[last] = {"no" : i1+1}
		
		i1+=1


func setVerb2():
	while i2 <= 1000:
		verb2_list.append(verb2.get_line())
		var last = verb2_list.back()
		
		verb2_dict[last] = {"no" : i2+1}
		
		i2+=1
	
	

func setVerb3():
	while i3 <= 1000:
		verb3_list.append(verb3.get_line())
		var last = verb3_list.back()
		
		verb3_dict[last] = {"no" : i3+1}
		
		i3+=1


func read():
	
	$result.text = ""
	$info.text = ""
	
	var v1 = false
	var v2 = false
	var v3 = false
	
	if search_word != null:
		for i in verb1_list:
			if i == str(search_word):
				print("Bulduk")
				v1 = true
				
				
		for i2 in verb2_list:
			if i2 == str(search_word):
				print("Bulduk")
				v2 = true
				
				
		for i3 in verb3_list:
			if i3 == str(search_word):
				print("Bulduk")
				v3 = true
				
		
		if (v1 == false and v2 == false and v3 == false):
			$result.text = "BULUNAMADI"
			$result.show()
		
		elif (v1 == true and v2 == false and v3 == false):
			$result.text = "FİİLİN 1. HALİ"
			$result.show()
			
			var verb1_no
			var verb2_no
			var verb3_no
			
			for i in verb1_dict.keys():
				if i == search_word:
					verb1_no = verb1_dict[i]["no"]
					
			
			for i in verb2_dict.keys():
				if verb2_dict[i]["no"] == verb1_no:
					$info.text += "Fiilin 2. Hali: " + i + "\n"
			
			for i in verb3_dict.keys():
				if verb3_dict[i]["no"] == verb1_no:
					$info.text += "Fiilin 3. Hali: " + i + "\n"
					$info.show()

		
		elif (v1 == false and v2 == true and v3 == false):
			$result.text = "FİİLİN 2. HALİ"
			$result.show()
			
			var verb1_no
			var verb2_no
			var verb3_no
			
			for i in verb2_dict.keys():
				if i == search_word:
					verb2_no = verb2_dict[i]["no"]
					
			
			for i in verb1_dict.keys():
				if verb1_dict[i]["no"] == verb2_no:
					$info.text += "Fiilin 1. Hali: " + i + "\n"
			
			for i in verb3_dict.keys():
				if verb3_dict[i]["no"] == verb2_no:
					$info.text += "Fiilin 3. Hali: " + i + "\n"
					$info.show()
		
		elif (v1 == false and v2 == false and v3 == true):
			$result.text = "FİİLİN 3. HALİ"
			$result.show()
			
			var verb1_no
			var verb2_no
			var verb3_no
			
			for i in verb3_dict.keys():
				if i == search_word:
					verb3_no = verb3_dict[i]["no"]
					
			
			for i in verb1_dict.keys():
				if verb1_dict[i]["no"] == verb3_no:
					$info.text += "Fiilin 1. Hali: " + i + "\n"
			
			for i in verb2_dict.keys():
				if verb2_dict[i]["no"] == verb3_no:
					$info.text += "Fiilin 2. Hali: " + i + "\n"
					$info.show()
			
		
		elif (v1 == true and v2 == true and v3 == false):
			$result.text = "FİİLİN 1. HALİ VE 2. HALİ AYNIDIR."
			$result.show()
			
		
		elif (v1 == true and v2 == true and v3 == true):
			$result.text = "FİİLİN 1. HALİ, 2. HALİ VE 3. HALİ AYNIDIR."
			$result.show()
		
		elif (v1 == true and v2 == false and v3 == true):
			$result.text = "FİİLİN 1. HALİ VE 3. HALİ AYNIDIR."
			$result.show()
		
		elif (v1 == false and v2 == true and v3 == true):
			$result.text = "FİİLİN 2. HALİ VE 3. HALİ AYNIDIR."
			$result.show()
			
			
			var verb1_no
			var verb2_no
			var verb3_no
			
			for i in verb2_dict.keys():
				if i == search_word:
					verb2_no = verb2_dict[i]["no"]
					
			
			for i in verb1_dict.keys():
				if verb1_dict[i]["no"] == verb2_no:
					$info.text += "Fiilin 1. Hali: " + i + "\n"
					$info.show()
		
		
		v1 = false
		v2 = false
		v3 = false



func _on_read_pressed():
	search_word = $WordEnter.text
	print(search_word)
	read()
