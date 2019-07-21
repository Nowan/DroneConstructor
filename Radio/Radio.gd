extends RigidBody2D

func _ready():
	pass

onready var radio = get_node("AudioStreamPlayer2D")

var prev = -1

var songs = [
	load("res://Radio/1. INTERDISCO - Prolog - from Vol 4-HdPlTXFABEA.ogg"),
	load("res://Radio/2. Halina Frąckowiak - Znikąd.ogg"),
	load("res://Radio/3. Novi Singers - Pas startowy (The Runway).ogg"),
	load("res://Radio/4. Bob Roy Orchestra - Drums 16.ogg"),
	load("res://Radio/5. Henryk Debich - Koncert a-moll.ogg"),
	load("res://Radio/6. MAREK BILINSKI - Ucieczka z tropiku _1984 audio HQ.ogg"),
	load("res://Radio/7. Orkiestra Rozrywkowa PRiTV 1 ‎— Strona A.ogg")
]

func _process(data):
	if radio.playing == false:
		var next
		if prev == -1:
			next = randi() % (songs.size())
		else:
			next = randi() % (songs.size() - 1)
			if next == prev:
				next += 1
		
		radio.stream = songs[next]
		radio.playing = true
		prev = next
