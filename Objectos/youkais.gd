extends Node
var Youkai = preload("res://classes/yokai.gd") 

var youkais = []

func _ready():
    # Amari
    var amari = Youkai.new(
        "Amari",
        "A figura de uma mulher, vestida de azul. Evite-a o quanto puder",
        ["Cortes", "Força", "Velocidade"],
        "Vingativa",
    )
    youkais.append(amari)

    # HenoHeno
    var henoheno = Youkai.new(
        "HenoHeno",
        "Uma figura que se assemelha a um papel com uma face desenhada. Ele é conhecido poor enganar as pessoas com sua lábia",
        ["Engano", "Velocidade", "Furtividade"],
        "Enganadora",
    )
    youkais.append(henoheno)

    # Maria

    var maria = Youkai.new(
        "Maria",
        "Uma das poucas entidades que é pacífica e amigável. Caso ofereça-te um item, aceite-o, mas não se aproxime demais. Ela pode se assustar",
        ["Velocidade", "Furtividade", "Engano"],
        "Pacífica",
    )
    youkais.append(maria)
