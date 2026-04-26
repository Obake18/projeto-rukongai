extends Node

# =========================
# REFERÊNCIA DA CLASSE
# =========================
#const Youkai = preload("res://classes/youkai.gd")

# =========================
# BANCO DE DADOS
# =========================
var youkais: Array[Youkai] = []

# =========================
# INIT
# =========================
func _ready():
	randomize()
	create_youkai()
	print("👻 YoukaiManager carregado:", youkais.size(), "youkais")


# =========================
# CRIAÇÃO DOS YOUKAIS
# =========================
func create_youkai():
	youkais.clear()

	# Amari
	add("Amari", "Mulher vestida de azul...", ["Corte", "Velocidade"], "Vingativa")
	var amari = youkais[-1]   # pega o último adicionado
	amari.hp = 20
	amari.attack_damage_min = 2
	amari.attack_damage_max = 6
	amari.behavior_type = "sneaky"
	amari.move_speed = 2.5
	amari.detection_range = 6.0
	amari.puzzle_type = "charada"
	amari.puzzle_question = "O que nunca pergunta mas sempre responde?"
	amari.puzzle_answer = "telefone"
	amari.reward_item = "corda"

	# HenoHeno
	add("HenoHeno", "Figura semelhante a um papel...", ["Engano", "Furtividade"], "Enganadora")
	var heno = youkais[-1]
	heno.hp = 12
	heno.attack_damage_min = 1
	heno.attack_damage_max = 3
	heno.behavior_type = "patrol"
	heno.puzzle_type = "charada"
	heno.puzzle_question = "Quanto mais você tira, maior fica. O que é?"
	heno.puzzle_answer = "buraco"

	# Maria (Pacífica)
	add("Maria", "Espírito pacífico...", ["Calma", "Furtividade"], "Pacífica")
	var maria = youkais[-1]
	maria.hp = 10
	maria.attack_damage_min = 1
	maria.attack_damage_max = 2
	maria.behavior_type = "static"
	maria.detection_range = 2.0

	# Oni
	add("Oni", "Força bruta...", ["Força", "Resistência"], "Hostil")
	var oni = youkais[-1]
	oni.hp = 30
	oni.attack_damage_min = 4
	oni.attack_damage_max = 9
	oni.behavior_type = "chase"
	oni.move_speed = 4.0
	oni.detection_range = 10.0
	oni.puzzle_type = "item"
	oni.puzzle_question = "Ofereça uma fruta."
	oni.puzzle_answer = "maçã"
	oni.reward_item = "chave antiga"

	# Kage
	add("Kage", "Sombra viva...", ["Furtividade", "Velocidade"], "Agressiva")
	var kage = youkais[-1]
	kage.hp = 18
	kage.attack_damage_min = 2
	kage.attack_damage_max = 5
	kage.behavior_type = "sneaky"
	kage.sneak_speed = 1.5

	# Yurei
	add("Yurei", "Alma presa...", ["Medo", "Velocidade"], "Vingativa")
	var yurei = youkais[-1]
	yurei.hp = 22
	yurei.attack_damage_min = 3
	yurei.attack_damage_max = 7
	yurei.behavior_type = "static"

	# Noppera-bo
	add("Noppera-bo", "Ser sem rosto...", ["Engano", "Medo"], "Enganadora")
	var noppera = youkais[-1]
	noppera.hp = 16
	noppera.attack_damage_min = 2
	noppera.attack_damage_max = 4
	noppera.behavior_type = "patrol"

	# Kodama
	add("Kodama", "Espírito da floresta...", ["Calma", "Engano"], "Neutra")
	var kodama = youkais[-1]
	kodama.hp = 12
	kodama.attack_damage_min = 1
	kodama.attack_damage_max = 3
	kodama.behavior_type = "patrol"

	# Tsuchigumo
	add("Tsuchigumo", "Criatura aranha...", ["Força", "Veneno"], "Hostil")
	var tsuchi = youkais[-1]
	tsuchi.hp = 35
	tsuchi.attack_damage_min = 5
	tsuchi.attack_damage_max = 10
	tsuchi.behavior_type = "chase"
	tsuchi.move_speed = 5.0
	tsuchi.detection_range = 12.0
	tsuchi.puzzle_type = "item"
	tsuchi.puzzle_answer = "tocha"


# =========================
# FUNÇÃO AUXILIAR
# =========================
func add(_name: String, desc: String, hab: Array[String], nat: String):
	var y = Youkai.new(_name, desc, hab, nat)
	youkais.append(y)


# =========================
# RANDOM SIMPLES
# =========================
func get_random_youkai() -> Youkai:
	if youkais.is_empty():
		push_warning("⚠ Lista de youkais vazia!")
		return null

	return youkais.pick_random()


# =========================
# FILTRO POR NATUREZA
# =========================
func get_youkai_by_nature(nature: String) -> Array[Youkai]:
	var result: Array[Youkai] = []

	for y in youkais:
		if y.natureza == nature:
			result.append(y)

	return result


# =========================
# RANDOM POR NATUREZA
# =========================
func get_random_by_nature(nature: String) -> Youkai:
	var filtered = get_youkai_by_nature(nature)

	if filtered.is_empty():
		push_warning("⚠ Nenhum youkai encontrado para: " + nature)
		return null

	return filtered.pick_random()


# =========================
# RANDOM INTELIGENTE (OPCIONAL)
# =========================
func get_weighted_random() -> Youkai:
	# Exemplo simples de raridade
	var roll = randf()

	if roll < 0.5:
		return get_random_by_nature("Enganadora")

	elif roll < 0.8:
		return get_random_by_nature("Vingativa")

	else:
		return get_random_youkai()


# =========================
# DEBUG
# =========================
func print_all():
	for y in youkais:
		print("👻", y.name, "|", y.natureza)
