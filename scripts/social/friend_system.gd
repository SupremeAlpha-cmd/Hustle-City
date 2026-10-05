extends Node
class_name FriendSystem
## Facebook-style friendships: request -> accept/decline -> friends.
## Strangers can knock (request). They cannot walk in (DM).
## Public venues have open chat; private chat is friends-only.

signal request_received(from_player_id: String)
signal friendship_updated(player_id: String, status: String) ## "friends" | "blocked" | "removed"

enum Relation { STRANGER, REQUEST_SENT, REQUEST_RECEIVED, FRIEND, BLOCKED }

var _relations: Dictionary = {} ## player_id -> Relation


func relation_of(player_id: String) -> int:
	return _relations.get(player_id, Relation.STRANGER)


func can_dm(player_id: String) -> bool:
	return relation_of(player_id) == Relation.FRIEND


func send_request(_player_id: String) -> void:
	push_warning("FriendSystem: wire to backend /friends/request")

func accept_request(_player_id: String) -> void:
	push_warning("FriendSystem: wire to backend /friends/accept")

func block(_player_id: String) -> void:
	push_warning("FriendSystem: wire to backend /friends/block")
