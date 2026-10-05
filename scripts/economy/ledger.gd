extends Node
class_name EconomyLedger
## Server-authoritative economy. The client NEVER declares a balance.
## Every naira moves through validated transactions on the backend.
## This client-side mirror only displays what the server confirms.

signal balance_changed(new_balance: int)

var _balance: int = 0 ## kobo-denominated; display only, server is truth


func balance_naira() -> float:
	return _balance / 100.0


func apply_server_balance(kobo: int) -> void:
	_balance = kobo
	balance_changed.emit(_balance)


## All mutations go through the backend. These are request stubs.
func request_earn(_job_id: String, _shift_minutes: float) -> void:
	push_warning("EconomyLedger: wire to backend /economy/earn")

func request_spend(_sink_id: String, _kobo: int) -> void:
	push_warning("EconomyLedger: wire to backend /economy/spend")

func request_transfer(_to_player_id: String, _kobo: int) -> void:
	push_warning("EconomyLedger: wire to backend /economy/transfer")
