# Hustle City — Architecture

## Pillars

1. **Real life simulation.** Real systems, not real minutes. 20:1 time ratio.
2. **Real friendships.** Facebook-style requests; strangers knock, they don't walk in.
3. **Coherent economy.** Server-authoritative ledger; jobs pay; crime is risky, not rational.
4. **Premium 3D avatars.** Slider-sculpted faces, modular parts. Never 2D.
5. **Multi-city.** One account global; each city a shard; expansion = add a city.

## Client (Godot 4, GDScript)

Exports: web (GL Compatibility) + Android. One project, both platforms.

| System | Script | Notes |
|---|---|---|
| World clock | `scripts/core/game_manager.gd` | 20:1, day counter, day/night |
| Economy (display) | `scripts/economy/ledger.gd` | Mirror only; server is truth |
| Friends | `scripts/social/friend_system.gd` | Request/accept/block; friends-only DM |
| Cities | `scripts/city/city_director.gd` | Shard map, home city, travel requests |
| Avatar | `scripts/avatar/avatar_customizer.gd` | Face sliders, modular parts, 2 quality tiers |

## Backend (authoritative)

Owns: accounts, the naira ledger, friend graph, job payouts, travel fares,
city shards. The client never declares a balance or a position the server
must trust.

Planned endpoints: `/economy/*`, `/friends/*`, `/travel`, `/city/*`, `/avatar`.

## Cities

- **benin** — Benin City (first shard, `hc-benin-01`), living index 1.0
- Future cities plug into `CityDirector.CITIES` with their own shard + living index.

## Time

20 game-minutes per real minute. Day one starts 08:00. A 30-minute session
covers ~10 game hours.
