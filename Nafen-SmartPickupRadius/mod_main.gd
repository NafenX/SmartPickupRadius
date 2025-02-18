extends Node


const AUTHORNAME_MODNAME_DIR := "Nafen-SmartPickupRadius"
const AUTHORNAME_MODNAME_LOG_NAME := "Nafen-SmartPickupRadius:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""


func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(AUTHORNAME_MODNAME_DIR)	
	install_script_extensions()
	add_translations()

func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.plus_file("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path + "/entities/units/player/player.gd")

func add_translations() -> void:
	translations_dir_path = mod_dir_path.plus_file("translations")
		# ModLoaderMod.add_translation(translations_dir_path.plus_file(...))

func _ready() -> void:
	ModLoaderLog.info("Ready!", AUTHORNAME_MODNAME_LOG_NAME)
