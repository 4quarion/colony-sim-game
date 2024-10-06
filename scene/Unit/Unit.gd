class_name unit
extends Area2D

@onready var  main = get_tree().root.get_node("Main")
@onready var  grid: Grid = main.get_node("Grid")

var data: UnitData

var speed = 100

var path: Array[Vector2]
var pos: Vector2 :
	get:
		return pos
	set(value):
		pos = value

func _ready():
	path = [Vector2(1,0), Vector2(1,1), Vector2(1,2), Vector2(2,2)]

func _process(delta):
	move(delta)

func move(delta):
	if path.size() > 0:
		if position.direction_to(grid.gridToWorld(path[0])) < 5:
			position = grid.gridToWorld(path[0])
			pos = path[0]
			path.pop_front()
		else:
			position += (grid.gridToWorld(path[0]) - position).normalized() * speed * delta
