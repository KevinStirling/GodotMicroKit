# GodotMicroKit

Godot MicroKit is framework for creating micro game collections in Godot!

It aims to provide helper funcitons, component nodes, and a game manager to allow one to focus on making as many microgames as they can, as fast as possible, and throw them into a big list to be played.

## Features

* A `game_manager.gd` script to put on the root node of you main game scene, which contains a `Game List` for you to drop all the MicroGame scenes you want to be played.
* An extendable `MicroGame` class to create your own MicroGame scenes, that includes helper functions and timers to send updates to your `game_manager` Node.
* Some component nodes that allow you to add basic functionality to parent nodes, such as making a node "click-and-draggable", or "follows the mouse".

