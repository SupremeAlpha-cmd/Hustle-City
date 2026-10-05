extends Node
class_name CityDirector
## Multi-city architecture. Each city is a shard; expansion = add a city.
## One account is global (character, money, friends). Travel is priced
## like real Nigerian transport: intra-city fares, inter-state bus fares.

signal city_changed(city_id: String)

const CITIES: Dictionary = {
	"benin": {"name": "Benin City", "shard": "hc-benin-01", "living_index": 1.0},
}

var home_city_id: String = "benin"
var current_city_id: String = "benin"


func city_name(city_id: String) -> String:
	return CITIES.get(city_id, {}).get("name", "Unknown")


func request_travel(_to_city_id: String) -> void:
	push_warning("CityDirector: wire to backend /travel (fare validated server-side)")
