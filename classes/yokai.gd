extends Resource
class_name Youkai

var name: String
var description: String
var abilities: Array
var natureza: String

func _init(_name: String, _description: String, _abilities: Array, _natureza: String):
    name = _name
    description = _description

    abilities = _abilities
    natureza = _natureza
