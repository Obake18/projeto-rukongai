extends Node
var Item = preload("res://classes/item.gd")
var itens = []

func _ready():
    # Corda
    var corda = Item.new(
        "Corda",
        "Uma corda resistente, útil para escalar ou amarrar coisas.",
        "Permite escalar superfícies ou amarrar objetos.",
    )
    itens.append(corda)

    # Lanterna
    var lanterna = Item.new(
        "Lanterna",
        "Uma lanterna que emite uma luz brilhante, útil para iluminar áreas escuras.",
        "Ilumina áreas escuras, revelando objetos ou caminhos ocultos.",
    )
    itens.append(lanterna)

    # Chave
    var chave = Item.new(
        "Chave",
        "Uma chave antiga, pode ser usada para abrir portas trancadas ou baús.",
        "Permite abrir portas trancadas ou baús, revelando tesouros ou passagens secretas.",
    )
    itens.append(chave)