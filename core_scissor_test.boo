/*******************************************************************************************
*
*   raylib [core] example - Scissor test
*
*   This example has been created using raylib 2.5 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Example contributed by Chris Dill (@MysteriousSpace) and reviewed by Ramon Santamaria (@raysan5)
*
*   Copyright (c) 2019 Chris Dill (@MysteriousSpace)
*
********************************************************************************************/
import raylib_boo

// Initialization
//--------------------------------------------------------------------------------------
screenWidth as int = 800
screenHeight as int = 450

InitWindow(screenWidth, screenHeight, "raylib [core] example - scissor test")

scissorArea = Rectangle(0, 0, 300, 300)
scissorMode as bool = true

SetTargetFPS(60)                // Set our game to run at 60 frames-per-second
//--------------------------------------------------------------------------------------

// Main game loop
while not WindowShouldClose():    // Detect window close button or ESC key
	// Update
	//----------------------------------------------------------------------------------
	if IsKeyPressed(KeyboardKey.KEY_S):
		scissorMode = not scissorMode

	// Centre the scissor area around the mouse position
	scissorArea.x = GetMouseX() - scissorArea.width / 2
	scissorArea.y = GetMouseY() - scissorArea.height / 2
	//----------------------------------------------------------------------------------

	// Draw
	//----------------------------------------------------------------------------------
	BeginDrawing()
	ClearBackground(RAYWHITE())
	
	if scissorMode:
		BeginScissorMode(scissorArea.x, scissorArea.y, scissorArea.width, scissorArea.height)

	// Draw full screen rectangle and some text
	// NOTE: Only part defined by scissor area will be rendered
	DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), RED())
	DrawText("Move the mouse around to reveal this text!", 190, 200, 20, LIGHTGRAY())

	if scissorMode:
		EndScissorMode()

	DrawRectangleLinesEx(scissorArea, 1, BLACK())
	DrawText("Press S to toggle scissor test", 10, 10, 20, BLACK())

	EndDrawing()
	//----------------------------------------------------------------------------------

// De-Initialization
//--------------------------------------------------------------------------------------
CloseWindow()         // Close window and OpenGL context
//--------------------------------------------------------------------------------------
