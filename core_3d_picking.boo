/*******************************************************************************************
*
*   raylib [core] example - Picking in 3d mode
*
*   This example has been created using raylib 1.3 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2015 Ramon Santamaria (@raysan5)
*
********************************************************************************************/
import raylib_boo

// Initialization
//--------------------------------------------------------------------------------------
screenWidth as int = 800
screenHeight as int = 450

InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d picking")

// Define the camera to look into our 3d world
camera as Camera
camera.position = Vector3(10.0f, 10.0f, 10.0f)  // Camera position
camera.target = Vector3(0.0f, 0.0f, 0.0f)       // Camera looking at point
camera.up = Vector3(0.0f, 1.0f, 0.0f)           // Camera up vector (rotation towards target)
camera.fovy = 45.0f                             // Camera field-of-view Y
camera.type = CameraType.CAMERA_PERSPECTIVE     // Camera mode type
cubePosition = Vector3(0.0f, 1.0f, 0.0f)
cubeSize = Vector3(2.0f, 2.0f, 2.0f)

ray as Ray        								// Picking line ray
collision as bool = false

SetCameraMode(camera, CameraMode.CAMERA_FREE)   // Set a free camera mode
SetTargetFPS(60)                                // Set our game to run at 60 frames-per-second
//--------------------------------------------------------------------------------------

// Main game loop
while not WindowShouldClose():                  // Detect window close button or ESC key
	
	// Update
	//----------------------------------------------------------------------------------
	UpdateCamera(camera)
	
	if IsMouseButtonPressed(MouseButton.MOUSE_LEFT_BUTTON):
		if not collision:
			ray = GetMouseRay(GetMousePosition(), camera)
			// Check collision between ray and box
			collision = CheckCollisionRayBox(ray, BoundingBox(Vector3(cubePosition.x - cubeSize.x/2, cubePosition.y - cubeSize.y/2, cubePosition.z - cubeSize.z/2), Vector3(cubePosition.x + cubeSize.x/2, cubePosition.y + cubeSize.y/2, cubePosition.z + cubeSize.z/2)))
		else:
			collision = false
	//----------------------------------------------------------------------------------
	
	// Draw
	//----------------------------------------------------------------------------------
	BeginDrawing()
	ClearBackground(RAYWHITE())	
	BeginMode3D(camera)
	
	if collision:
		DrawCube(cubePosition, cubeSize.x, cubeSize.y, cubeSize.z, RED())
		DrawCubeWires(cubePosition, cubeSize.x, cubeSize.y, cubeSize.z, MAROON())
		DrawCubeWires(cubePosition, cubeSize.x + 0.2f, cubeSize.y + 0.2f, cubeSize.z + 0.2f, GREEN())
	else:
		DrawCube(cubePosition, cubeSize.x, cubeSize.y, cubeSize.z, GRAY())
		DrawCubeWires(cubePosition, cubeSize.x, cubeSize.y, cubeSize.z, DARKGRAY())
	
	DrawRay(ray, MAROON())
	DrawGrid(10, 1.0f)
	EndMode3D()
	DrawText("Try selecting the box with mouse!", 240, 10, 20, DARKGRAY())

	if collision:
		DrawText("BOX SELECTED", (screenWidth - MeasureText("BOX SELECTED", 30)) / 2, screenHeight * 0.1f, 30, GREEN())

	DrawFPS(10, 10)
	
	EndDrawing()
	//----------------------------------------------------------------------------------

// De-Initialization
//--------------------------------------------------------------------------------------
CloseWindow()        // Close window and OpenGL context
//--------------------------------------------------------------------------------------