# Ray casting examples
Some examples of ray casting using different techniques, programmed in Processing.
Ray casting is a technique for rendering computer graphics. Basically the idea is to trace rays from the eye and find the closest objects blocking the path of each of it.

----

### simpleraycasting
Without optimization, each beam is checked against all walls.

### bspraycasting
A binary space partition tree (BSP) is used to rule out walls. The tree must be pre-compiled.

### bsp3draycasting
3D scene rendering with collision detection.
