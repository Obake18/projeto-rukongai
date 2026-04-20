extends Node3D

# =========================
# CONFIGURAÇÃO
# =========================

# Cena do ghost
@export var ghost_scene: PackedScene

# Quantidade de fantasmas
@export var spawn_count := 3

# Referência ao chão (mapa)
@export var floor_path: NodePath

# Distância mínima entre fantasmas
@export var min_distance := 5.0

# Margem para não spawnar na borda
@export var margin := 2.0


# =========================
# VARIÁVEIS INTERNAS
# =========================

var map_min: Vector3
var map_max: Vector3
var spawned_positions: Array = []


# =========================
# INÍCIO
# =========================

func _ready():
	randomize()

	calculate_map_bounds()

	print("Spawner rodando")
	spawn_ghosts()


# =========================
# CALCULAR TAMANHO DO MAPA
# =========================

func calculate_map_bounds():
	var floor = get_node(floor_path)

	var mesh_instance = floor.get_node("MeshInstance3D")
	var mesh = mesh_instance.mesh

	var aabb = mesh.get_aabb()

	var size = aabb.size * mesh_instance.scale
	var pos = mesh_instance.global_position

	map_min = pos - size / 2
	map_max = pos + size / 2

	print("📍 Limites do mapa:")
	print("Min:", map_min)
	print("Max:", map_max)


# =========================
# SPAWN DOS GHOSTS
# =========================

func spawn_ghosts():
	if ghost_scene == null:
		print("❌ ERRO: ghost_scene está NULL")
		return

	spawned_positions.clear()

	for i in spawn_count:
		var ghost = ghost_scene.instantiate()

		var pos = get_valid_position()
		ghost.position = pos

		add_child(ghost)

		# Debug do Youkai
		if ghost.has_variable("youkai_data") and ghost.youkai_data != null:
			print("👻 Ghost spawnado:", ghost.youkai_data.name, "em", pos)
		else:
			print("👻 Ghost spawnado sem Youkai em", pos)


# =========================
# POSIÇÃO VÁLIDA
# =========================

func get_valid_position() -> Vector3:
	var attempts := 0

	while attempts < 20:
		var pos = Vector3(
			randf_range(map_min.x + margin, map_max.x - margin),
			1,
			randf_range(map_min.z + margin, map_max.z - margin)
		)

		if is_position_valid(pos):
			spawned_positions.append(pos)
			return pos

		attempts += 1

	print("⚠ Falha ao achar posição ideal, usando fallback")
	return Vector3(0, 1, 0)


# =========================
# EVITAR SOBREPOSIÇÃO
# =========================

func is_position_valid(pos: Vector3) -> bool:
	for existing_pos in spawned_positions:
		if pos.distance_to(existing_pos) < min_distance:
			return false
	return true
