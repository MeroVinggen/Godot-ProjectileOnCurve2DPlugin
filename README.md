<p align="center">
  <img src="./icon.svg"  height="100" alt="Godot-ProjectileOnCurve2DPlugin Icon"/>
</p>

<h1 align="center">
  Godot ProjectileOnCurve2D Plugin
</h1>

## About

The plugin allows you to create 2d projectiles that moves toward the target on curve with gravity adjustment.


## Features

- Adjusting the angle of a curve by manipulating the projectile gravity
- Changing the projectile speed without affecting the trajectory
- Projectile auto rotation along the curve
  
> The trajectory is calculated only based on gravity, initial and target positions.


## Requirements 

- Godot 4.2 or higher


## Installation

- Open the `AssetLib` tab in Godot with your project open.
- Search for "ProjectileOnCurve2D Plugin" and install the plugin by Mero.
- Once the download completes, deselect "demo" if you don't need the example scene.
- Open project settings -> plugins, and enable the plugin "ProjectileOnCurve2DPlugin".
- Done!


## Usage

1. Install the plugin
2. Enable the plugin in Godot (Project -> Project Settings -> Plugins Tab)
3. Use the new node type "ProjectileOnCurve2D" to create projectile scene

> The "ProjectileOnCurve2D" node can be both a root or subnode in your projectile scene. It does not force a specific node structure, allowing you to create projectiles with any logic and structure needed. Below are a couple approaches for creating a projectile using "ProjectileOnCurve2D" as a starting point.

4. Call `launch` method on "ProjectileOnCurve2D" to setup and start the movement

```
newProjectile.launch(initialGlobalPosition, targetGlobalPosition, gravity, speed)
```

> Adjust the `gravity` param to gain desirable motion curve (the bigger is gravity - the bigger curve angle becomes: 0 gravity will result in a straight trajectory). In "Demo Preview" section below you may see projectiles with different gravity and speed.

> `Speed` param doesn't affect the trajectory curve, only changes the motion speed on it.


### Using "ProjectileOnCurve2D" as root node

> This approach has been used in the demo where you can find code example of this concept

In this approach the "ProjectileOnCurve2D" will be used as root node in new projectile scene, it will move and rotate it self toward the target and provide `launch` function to setup and start the projectile motion. The appearance, collision etc. should be implemented by subnodes. 

If necessary - inherit the "ProjectileOnCurve2D" script for additional logic.

> Note: the "ProjectileOnCurve2D" also changes its scale.y when target is from the right side.


### Using "ProjectileOnCurve2D" as subnode (not desirable)

If you need your projectile root node to be of any other type (such as Area2D, Sprite2D etc.) your way is to add "ProjectileOnCurve2D" as subnode and extend it's script (or create new any 2D node and extend it's script from "ProjectileOnCurve2D") where you need to synchronize the movement between "ProjectileOnCurve2D" and your projectile scene depending on your goals. 

The "ProjectileOnCurve2D" is moving, rotating and scaling it self so to make it move your entire projectile scene or a certain nodes - you need to inherit and overload the `_physics_process` and use the "ProjectileOnCurve2D" transformations in your purposes:

```
_physics_process(delta):
  # the "ProjectileOnCurve2D" motion
  super._physics_process(delta)

  # sync transformations of your root node with the "ProjectileOnCurve2D"
  owner.position = position
  owner.rotation = rotation
  # caution! the "ProjectileOnCurve2D" changes its scale.y when target is from the right side
  owner.scale = scale
```

Sure thing you may sync only position and handle rotation/scale manually.


## Demo

> Note: don't forget to check "Requirements" & "Usage" sections.

- Install the plugin and leave "demo" folder as selected
- Launch "demo/towersDemo.tscn" scene
- Play around with towers projectile exported params (towers sub-scenes at towersDemo.tscn)

> If you have already installed the plugin without the "demo" folder, just download it from the current repository and place it in your project, all other steps remain the same.


## Demo Preview 

![demo preview](./demoPreview.gif)
