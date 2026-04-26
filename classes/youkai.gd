extends Resource
class_name Youkai

# =========================
# IDENTIFICAÇÃO
# =========================
@export var name: String
@export var description: String
@export var abilities: Array[String]
@export var natureza: String

# =========================
# STATUS DE COMBATE
# =========================
@export var hp: int = 15
@export var attack_damage_min: int = 1
@export var attack_damage_max: int = 4
@export var dodge_chance: float = 0.1

# =========================
# COMPORTAMENTO NO MUNDO
# =========================
@export var behavior_type: String = "static"   # "static", "patrol", "sneaky", "chase"
@export var move_speed: float = 2.0
@export var detection_range: float = 5.0
@export var sneak_speed: float = 1.0

# =========================
# PUZZLE / NEGOCIAÇÃO
# =========================
@export var puzzle_type: String = "charada"
@export var puzzle_question: String = ""
@export var puzzle_answer: String = ""
@export var reward_item: String = ""

# =========================
# CONSTRUTOR (opcional, só para facilitar)
# =========================
func _init(_name: String = "", _desc: String = "", _abilities: Array[String] = [], _natureza: String = ""):
    name = _name
    description = _desc
    abilities = _abilities
    natureza = _natureza