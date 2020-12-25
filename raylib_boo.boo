// Written by Rabia Alhaffar in 17/October/2020
// raylib-boo, Single-file Boo bindings for raylib library!
// Updated: 25/December/2020
/**********************************************************************************************
*
*   raylib - A simple and easy-to-use library to enjoy videogames programming (www.raylib.com)
*
*   FEATURES:
*       - NO external dependencies, all required libraries included with raylib
*       - Multiplatform: Windows, Linux, FreeBSD, OpenBSD, NetBSD, DragonFly, MacOS, UWP, Android, Raspberry Pi, HTML5.
*       - Written in plain C code (C99) in PascalCase/camelCase notation
*       - Hardware accelerated with OpenGL (1.1, 2.1, 3.3 or ES2 - choose at compile)
*       - Unique OpenGL abstraction layer (usable as standalone module): [rlgl]
*       - Multiple Fonts formats supported (TTF, XNA fonts, AngelCode fonts)
*       - Outstanding texture formats support, including compressed formats (DXT, ETC, ASTC)
*       - Full 3d support for 3d Shapes, Models, Billboards, Heightmaps and more!
*       - Flexible Materials system, supporting classic maps and PBR maps
*       - Skeletal Animation support (CPU bones-based animation)
*       - Shaders support, including Model shaders and Postprocessing shaders
*       - Powerful math module for Vector, Matrix and Quaternion operations: [raymath]
*       - Audio loading and playing with streaming support (WAV, OGG, MP3, FLAC, XM, MOD)
*       - VR stereo rendering with configurable HMD device parameters
*       - Bindings to multiple programming languages available!
*
*   NOTES:
*       One custom font is loaded by default when InitWindow() [core]
*       If using OpenGL 3.3 or ES2, one default shader is loaded automatically (internally defined) [rlgl]
*       If using OpenGL 3.3 or ES2, several vertex buffers (VAO/VBO) are created to manage lines-triangles-quads
*
*   DEPENDENCIES (included):
*       [core] rglfw (github.com/glfw/glfw) for window/context management and input (only PLATFORM_DESKTOP)
*       [rlgl] glad (github.com/Dav1dde/glad) for OpenGL 3.3 extensions loading (only PLATFORM_DESKTOP)
*       [raudio] miniaudio (github.com/dr-soft/miniaudio) for audio device/context management
*
*   OPTIONAL DEPENDENCIES (included):
*       [core] rgif (Charlie Tangora, Ramon Santamaria) for GIF recording
*       [textures] stb_image (Sean Barret) for images loading (BMP, TGA, PNG, JPEG, HDR...)
*       [textures] stb_image_write (Sean Barret) for image writting (BMP, TGA, PNG, JPG)
*       [textures] stb_image_resize (Sean Barret) for image resizing algorithms
*       [textures] stb_perlin (Sean Barret) for Perlin noise image generation
*       [text] stb_truetype (Sean Barret) for ttf fonts loading
*       [text] stb_rect_pack (Sean Barret) for rectangles packing
*       [models] par_shapes (Philip Rideout) for parametric 3d shapes generation
*       [models] tinyobj_loader_c (Syoyo Fujita) for models loading (OBJ, MTL)
*       [models] cgltf (Johannes Kuhlmann) for models loading (glTF)
*       [raudio] stb_vorbis (Sean Barret) for OGG audio loading
*       [raudio] dr_flac (David Reid) for FLAC audio file loading
*       [raudio] dr_mp3 (David Reid) for MP3 audio file loading
*       [raudio] jar_xm (Joshua Reisenauer) for XM audio module loading
*       [raudio] jar_mod (Joshua Reisenauer) for MOD audio module loading
*
*
*   LICENSE: zlib/libpng
*
*   raylib is licensed under an unmodified zlib/libpng license, which is an OSI-certified,
*   BSD-like license that allows static linking with closed source software:
*
*   Copyright (c) 2013-2020 Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************/
namespace raylib_boo
import System
import System.Runtime.InteropServices

//----------------------------------------------------------------------------------
// Some basic Defines
//----------------------------------------------------------------------------------
def PI() as single:
	return 3.14159265358979323846f

def DEG2RAD() as single:
	return PI() / 180.0f

def RAD2DEG() as single:
	return 180.0f / PI()

// Maximum number of touch points supported
def MAX_TOUCH_POINTS() as int:
	return 10

//----------------------------------------------------------------------------------
// Structures Definition
//----------------------------------------------------------------------------------
// Vector2 type
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Vector2:
	x as single
	y as single
	
	def constructor(_x as single, _y as single):
		x = _x
		y = _y
		
	def constructor(_x as int, _y as int):
		x = System.Convert.ToSingle(x)
		y = System.Convert.ToSingle(y)

// Vector3 type
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Vector3:
	x as single
	y as single
	z as single
	
	def constructor(_x as single, _y as single, _z as single):
		x = _x
		y = _y
		z = _z
		
	def constructor(_x as int, _y as int, _z as int):
		x = System.Convert.ToSingle(_x)
		y = System.Convert.ToSingle(_y)
		z = System.Convert.ToSingle(_z)

// Vector4 type
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Vector4:
	x as single
	y as single
	z as single
	w as single
	
	def constructor(_x as single, _y as single, _z as single, _w as single):
		x = _x
		y = _y
		z = _z
		w = _w
		
	def constructor(_x as int, _y as int, _z as int, _w as int):
		x = System.Convert.ToSingle(_x)
		y = System.Convert.ToSingle(_y)
		z = System.Convert.ToSingle(_z)
		w = System.Convert.ToSingle(_w)

// Quaternion type, same as Vector4
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Quaternion:
	x as single
	y as single
	z as single
	w as single
	
	def constructor(_x as single, _y as single, _z as single, _w as single):
		x = _x
		y = _y
		z = _z
		w = _w
	
	def constructor(_x as int, _y as int, _z as int, _w as int):
		x = System.Convert.ToSingle(_x)
		y = System.Convert.ToSingle(_y)
		z = System.Convert.ToSingle(_z)
		w = System.Convert.ToSingle(_w)

// Matrix type (OpenGL style 4x4 - right handed, column major)
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Matrix:
	m0 as single
	m1 as single
	m2 as single
	m3 as single
	m4 as single
	m5 as single
	m6 as single
	m7 as single
	m8 as single
	m9 as single
	m10 as single
	m11 as single
	m12 as single
	m13 as single
	m14 as single
	m15 as single
	
	def constructor(_m0 as single, _m1 as single, _m2 as single, _m3 as single, _m4 as single, _m5 as single, _m6 as single, _m7 as single, _m8 as single, _m9 as single, _m10 as single, _m11 as single, _m12 as single, _m13 as single, _m14 as single, _m15 as single):
		m0 = _m0
		m1 = _m1
		m2 = _m2
		m3 = _m3
		m4 = _m4
		m5 = _m5
		m6 = _m6
		m7 = _m7
		m8 = _m8
		m9 = _m9
		m10 = _m10
		m11 = _m11
		m12 = _m12
		m13 = _m13
		m14 = _m14
		m15 = _m15
		
	def constructor(_m0 as int, _m1 as int, _m2 as int, _m3 as int, _m4 as int, _m5 as int, _m6 as int, _m7 as int, _m8 as int, _m9 as int, _m10 as int, _m11 as int, _m12 as int, _m13 as int, _m14 as int, _m15 as int):
		m0 = System.Convert.ToSingle(_m0)
		m1 = System.Convert.ToSingle(_m1)
		m2 = System.Convert.ToSingle(_m2)
		m3 = System.Convert.ToSingle(_m3)
		m4 = System.Convert.ToSingle(_m4)
		m5 = System.Convert.ToSingle(_m5)
		m6 = System.Convert.ToSingle(_m6)
		m7 = System.Convert.ToSingle(_m7)
		m8 = System.Convert.ToSingle(_m8)
		m9 = System.Convert.ToSingle(_m9)
		m10 = System.Convert.ToSingle(_m10)
		m11 = System.Convert.ToSingle(_m11)
		m12 = System.Convert.ToSingle(_m12)
		m13 = System.Convert.ToSingle(_m13)
		m14 = System.Convert.ToSingle(_m14)
		m15 = System.Convert.ToSingle(_m15)

// Color type, RGBA (32bit)
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Color:
	r as byte
	g as byte
	b as byte
	a as byte

	def constructor(_r as byte, _g as byte, _b as byte, _a as byte):
		r = _r
		g = _g
		b = _b
		a = _a
	
	def constructor(_r as int, _g as int, _b as int, _a as int):
		r = System.Convert.ToByte(_r)
		g = System.Convert.ToByte(_g)
		b = System.Convert.ToByte(_b)
		a = System.Convert.ToByte(_a)

// Some Basic Colors
// NOTE: Custom raylib color palette for amazing visuals on WHITE background
def LIGHTGRAY() as Color:
	return Color(200, 200, 200, 255)

def GRAY() as Color:
	return Color(130, 130, 130, 255)
	
def DARKGRAY() as Color:
	return Color(200, 200, 200, 255)
	
def YELLOW() as Color:
	return Color(253, 249, 0, 255)

def GOLD() as Color:
	return Color(255, 203, 0, 255)
	
def ORANGE() as Color:
	return Color(255, 161, 0, 255)
	
def PINK() as Color:
	return Color(255, 109, 194, 255)

def RED() as Color:
	return Color(230, 41, 55, 255)

def MAROON() as Color:
	return Color(190, 33, 55, 255)
	
def GREEN() as Color:
	return Color(0, 228, 48, 255)
	
def LIME() as Color:
	return Color(0, 158, 47, 255)
	
def DARKGREEN() as Color:
	return Color(0, 117, 44, 255)
	
def SKYBLUE() as Color:
	return Color(102, 191, 255, 255)
	
def BLUE() as Color:
	return Color(0, 121, 241, 255)
	
def DARKBLUE() as Color:
	return Color(0, 82, 172, 255)
	
def PURPLE() as Color:
	return Color(200, 122, 255, 255)
	
def VIOLET() as Color:
	return Color(135, 60, 190, 255)
	
def DARKPURPLE() as Color:
	return Color(112, 31, 126, 255)
	
def BEIGE() as Color:
	return Color(211, 176, 131, 255)
	
def BROWN() as Color:
	return Color(127, 106, 79, 255)
	
def DARKBROWN() as Color:
	return Color(76, 63, 47, 255)
	
def WHITE() as Color:
	return Color(255, 255, 255, 255)
	
def BLACK() as Color:
	return Color(0, 0, 0, 255)
	
def BLANK() as Color:
	return Color(0, 0, 0, 0)
	
def MAGENTA() as Color:
	return Color(255, 0, 255, 255)
	
def RAYWHITE() as Color:
	return Color(245, 245, 245, 255)
	
// Rectangle type
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Rectangle:
	x as single
	y as single
	width as single
	height as single
	
	def constructor(_x as single, _y as single, _width as single, _height as single):
		x = _x
		y = _y
		width = _width
		height = _height
		
	def constructor(_x as int, _y as int, _width as int, _height as int):
		x = System.Convert.ToSingle(_x)
		y = System.Convert.ToSingle(_y)
		width = System.Convert.ToSingle(_width)
		height = System.Convert.ToSingle(_height)

// Image type, bpp always RGBA (32bit)
// NOTE: Data stored in CPU memory (RAM)
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Image:
	data as IntPtr
	width as int
	height as int
	mipmaps as int
	format as int

// Texture2D type
// NOTE: Data stored in GPU memory
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Texture2D:
	id as uint
	width as int
	height as int
	mipmaps as int
	format as int

// Texture type, same as Texture2D
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Texture:
	id as uint
	width as int
	height as int
	mipmaps as int
	format as int

// TextureCubemap type, actually, same as Texture2D
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct TextureCubemap:
	id as uint
	width as int
	height as int
	mipmaps as int
	format as int

// RenderTexture2D type, for texture rendering
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct RenderTexture2D:
	id as uint
	texture as Texture2D
	depth as Texture2D

// RenderTexture type, same as RenderTexture2D
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct RenderTexture:
	id as uint
	texture as Texture2D
	depth as Texture2D

// N-Patch layout info
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct NPatchInfo:
	source as Rectangle
	left as int
	top as int
	right as int
	bottom as int
	type as int

// Font character info
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct CharInfo:
	value as int
	offsetX as int
	offsetY as int
	advanceX as int
	image as Image

// Font type, includes texture and charSet array data
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Font:
	baseSize as int
	charsCount as int
	charsPadding as int
	texture as Texture2D
	recs as IntPtr
	chars as IntPtr

// SpriteFont type fallback, defaults to Font
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct SpriteFont:
	baseSize as int
	charsCount as int
	texture as Texture2D
	recs as IntPtr
	chars as IntPtr

// Camera type, defines a camera position/orientation in 3d space
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Camera3D:
	position as Vector3
	target as Vector3
	up as Vector3
	fovy as single
	type as int
	
	def constructor(_position as Vector3, _target as Vector3, _up as Vector3, _fovy as single, _type as int):
		position = _position
		target = _target
		up = _up
		fovy = _fovy
		type = _type

// Camera type fallback, defaults to Camera3D
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Camera:
	position as Vector3
	target as Vector3
	up as Vector3
	fovy as single
	type as int
	
	def constructor(_position as Vector3, _target as Vector3, _up as Vector3, _fovy as single, _type as int):
		position = _position
		target = _target
		up = _up
		fovy = _fovy
		type = _type

// Camera2D type, defines a 2d camera
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Camera2D:
	offset as Vector2
	target as Vector2
	rotation as single
	zoom as single
	
	def constructor(_offset as Vector2, _target as Vector2, _rotation as single, _zoom as single):
		offset = _offset
		target = _target
		rotation = _rotation
		zoom = _zoom
		
// Vertex data definning a mesh
// NOTE: Data stored in CPU memory (and GPU)
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Mesh:
	vertexCount as int
	triangleCount as int
	
	vertices as IntPtr
	texcoords as IntPtr
	texcoords2 as IntPtr
	normals as IntPtr
	tangents as IntPtr
	colors as IntPtr
	indices as IntPtr
	
	animVertices as IntPtr
	animNormas as IntPtr
	boneIds as IntPtr
	boneWeights as IntPtr
	
	vaoId as uint
	vboId as IntPtr

// Shader type (generic)
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Shader:
	id as uint
	locs as IntPtr

// Material texture map
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct MaterialMap:
	texture as Texture2D
	color as Color
	value as single

// Material type (generic)
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Material:
	shader as Shader
	maps as IntPtr
	params as IntPtr

// Transformation properties
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Transform:
	translation as Vector3
	rotation as Quaternion
	scale as Vector3

// Bone information
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct BoneInfo:
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 32)]
	name as (char)
	parent as int

// Model type
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Model:
	transform as Matrix
	
	meshCount as int
	materialCount as int
	
	meshes as IntPtr
	materials as IntPtr
	meshMaterial as IntPtr
	
	boneCount as int
	bones as IntPtr
	bindPose as IntPtr

// Model animation
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct ModelAnimation:
	boneCount as int
	frameCount as int
	
	bones as IntPtr
	framePoses as IntPtr

// Ray type (useful for raycast)
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Ray:
	position as Vector3
	direction as Vector3
	
	def constructor(_position as Vector3, _direction as Vector3):
		position = _position
		direction = _direction

// Raycast hit information
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct RayHitInfo:
	hit as bool
	distance as single
	position as Vector3
	normal as Vector3

// Bounding box type
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct BoundingBox:
	min as Vector3
	max as Vector3
	
	def constructor(_min as Vector3, _max as Vector3):
		min = _min
		max = _max

// Wave type, defines audio wave data
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Wave:
	sampleCount as uint
	sampleRate as uint
	sampleSize as uint
	channels as uint
	data as IntPtr

[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct rAudioBuffer:
	pass
	
// Audio stream type
// NOTE: Useful to create custom audio streams not bound to a specific file
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct AudioStream:
	buffer as IntPtr
	sampleRate as uint
	sampleSize as uint
	channels as uint	

// Sound source type
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Sound:
	stream as AudioStream
	sampleCount as uint

// Music stream type (audio file streaming from memory)
// NOTE: Anything longer than ~10 seconds should be streamed
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct Music:
	stream as AudioStream
	sampleCount as uint
	looping as bool
	
	ctxType as int
	ctxData as IntPtr

// Head-Mounted-Display device parameters
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct VrDeviceInfo:
	hResolution as int
	vResolution as int
	hScreenSize as single
	vScreenSize as single
	vScreenCenter as single
	eyeToScreenDistance as single
	lensSeparationDistance as single
	interpupillaryDistance as single
	
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 4)]
	lensDistortionValues as (single)
	
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 4)]
	chromaAbCorrection as (single)

//----------------------------------------------------------------------------------
// Enumerators Definition
//----------------------------------------------------------------------------------
// System config flags
// NOTE: Used for bit masks
public enum ConfigFlag:
	FLAG_VSYNC_HINT         = 0x00000040   // Set to try enabling V-Sync on GPU
	FLAG_FULLSCREEN_MODE    = 0x00000002   // Set to run program in fullscreen
	FLAG_WINDOW_RESIZABLE   = 0x00000004   // Set to allow resizable window
	FLAG_WINDOW_UNDECORATED = 0x00000008   // Set to disable window decoration (frame and buttons)
	FLAG_WINDOW_HIDDEN      = 0x00000080   // Set to hide window
	FLAG_WINDOW_MINIMIZED   = 0x00000200   // Set to minimize window (iconify)
	FLAG_WINDOW_MAXIMIZED   = 0x00000400   // Set to maximize window (expanded to monitor)
	FLAG_WINDOW_UNFOCUSED   = 0x00000800   // Set to window non focused
	FLAG_WINDOW_TOPMOST     = 0x00001000   // Set to window always on top
	FLAG_WINDOW_ALWAYS_RUN  = 0x00000100   // Set to allow windows running while minimized
	FLAG_WINDOW_TRANSPARENT = 0x00000010   // Set to allow transparent framebuffer
	FLAG_WINDOW_HIGHDPI     = 0x00002000   // Set to support HighDPI
	FLAG_MSAA_4X_HINT       = 0x00000020   // Set to try enabling MSAA 4X
	FLAG_INTERLACED_HINT    = 0x00010000    // Set to try enabling interlaced video format (for V3D)	

// Trace log type
public enum TraceLogType:
	LOG_ALL = 0        // Display all logs
	LOG_TRACE
	LOG_DEBUG
	LOG_INFO
	LOG_WARNING
	LOG_ERROR
	LOG_FATAL
	LOG_NONE            // Disable logging

// Keyboard keys (US keyboard layout)
// NOTE: Use GetKeyPressed() to allow redefining
// required keys for alternative layouts
public enum KeyboardKey:
	// Alphanumeric keys
	KEY_APOSTROPHE      = 39
	KEY_COMMA           = 44
	KEY_MINUS           = 45
	KEY_PERIOD          = 46
	KEY_SLASH           = 47
	KEY_ZERO            = 48
	KEY_ONE             = 49
	KEY_TWO             = 50
	KEY_THREE           = 51
	KEY_FOUR            = 52
	KEY_FIVE            = 53
	KEY_SIX             = 54
	KEY_SEVEN           = 55
	KEY_EIGHT           = 56
	KEY_NINE            = 57
	KEY_SEMICOLON       = 59
	KEY_EQUAL           = 61
	KEY_A               = 65
	KEY_B               = 66
	KEY_C               = 67
	KEY_D               = 68
	KEY_E               = 69
	KEY_F               = 70
	KEY_G               = 71
	KEY_H               = 72
	KEY_I               = 73
	KEY_J               = 74
	KEY_K               = 75
	KEY_L               = 76
	KEY_M               = 77
	KEY_N               = 78
	KEY_O               = 79
	KEY_P               = 80
	KEY_Q               = 81
	KEY_R               = 82
	KEY_S               = 83
	KEY_T               = 84
	KEY_U               = 85
	KEY_V               = 86
	KEY_W               = 87
	KEY_X               = 88
	KEY_Y               = 89
	KEY_Z               = 90

	// Function keys
	KEY_SPACE           = 32
	KEY_ESCAPE          = 256
	KEY_ENTER           = 257
	KEY_TAB             = 258
	KEY_BACKSPACE       = 259
	KEY_INSERT          = 260
	KEY_DELETE          = 261
	KEY_RIGHT           = 262
	KEY_LEFT            = 263
	KEY_DOWN            = 264
	KEY_UP              = 265
	KEY_PAGE_UP         = 266
	KEY_PAGE_DOWN       = 267
	KEY_HOME            = 268
	KEY_END             = 269
	KEY_CAPS_LOCK       = 280
	KEY_SCROLL_LOCK     = 281
	KEY_NUM_LOCK        = 282
	KEY_PRINT_SCREEN    = 283
	KEY_PAUSE           = 284
	KEY_F1              = 290
	KEY_F2              = 291
	KEY_F3              = 292
	KEY_F4              = 293
	KEY_F5              = 294
	KEY_F6              = 295
	KEY_F7              = 296
	KEY_F8              = 297
	KEY_F9              = 298
	KEY_F10             = 299
	KEY_F11             = 300
	KEY_F12             = 301
	KEY_LEFT_SHIFT      = 340
	KEY_LEFT_CONTROL    = 341
	KEY_LEFT_ALT        = 342
	KEY_LEFT_SUPER      = 343
	KEY_RIGHT_SHIFT     = 344
	KEY_RIGHT_CONTROL   = 345
	KEY_RIGHT_ALT       = 346
	KEY_RIGHT_SUPER     = 347
	KEY_KB_MENU         = 348
	KEY_LEFT_BRACKET    = 91
	KEY_BACKSLASH       = 92
	KEY_RIGHT_BRACKET   = 93
	KEY_GRAVE           = 96

	// Keypad keys
	KEY_KP_0            = 320
	KEY_KP_1            = 321
	KEY_KP_2            = 322
	KEY_KP_3            = 323
	KEY_KP_4            = 324
	KEY_KP_5            = 325
	KEY_KP_6            = 326
	KEY_KP_7            = 327
	KEY_KP_8            = 328
	KEY_KP_9            = 329
	KEY_KP_DECIMAL      = 330
	KEY_KP_DIVIDE       = 331
	KEY_KP_MULTIPLY     = 332
	KEY_KP_SUBTRACT     = 333
	KEY_KP_ADD          = 334
	KEY_KP_ENTER        = 335
	KEY_KP_EQUAL        = 336

// Mouse cursor types
public enum MouseCursor:
	MOUSE_CURSOR_DEFAULT       = 0
	MOUSE_CURSOR_ARROW         = 1
	MOUSE_CURSOR_IBEAM         = 2
	MOUSE_CURSOR_CROSSHAIR     = 3
	MOUSE_CURSOR_POINTING_HAND = 4
	MOUSE_CURSOR_RESIZE_EW     = 5     // The horizontal resize/move arrow shape
	MOUSE_CURSOR_RESIZE_NS     = 6     // The vertical resize/move arrow shape
	MOUSE_CURSOR_RESIZE_NWSE   = 7     // The top-left to bottom-right diagonal resize/move arrow shape
	MOUSE_CURSOR_RESIZE_NESW   = 8     // The top-right to bottom-left diagonal resize/move arrow shape
	MOUSE_CURSOR_RESIZE_ALL    = 9     // The omni-directional resize/move cursor shape
	MOUSE_CURSOR_NOT_ALLOWED   = 10    // The operation-not-allowed shape
	
// Android buttons
public enum AndroidButton:
	KEY_BACK            = 4
	KEY_MENU            = 82
	KEY_VOLUME_UP       = 24
	KEY_VOLUME_DOWN     = 25

// Mouse buttons
public enum MouseButton:
	MOUSE_LEFT_BUTTON   = 0
	MOUSE_RIGHT_BUTTON  = 1
	MOUSE_MIDDLE_BUTTON = 2

// Gamepad number
public enum GamepadNumber:
	GAMEPAD_PLAYER1     = 0
	GAMEPAD_PLAYER2     = 1
	GAMEPAD_PLAYER3     = 2
	GAMEPAD_PLAYER4     = 3

// Gamepad buttons
public enum GamepadButton:
	// This is here just for error checking
	GAMEPAD_BUTTON_UNKNOWN = 0

	// This is normally a DPAD
	GAMEPAD_BUTTON_LEFT_FACE_UP
	GAMEPAD_BUTTON_LEFT_FACE_RIGHT
	GAMEPAD_BUTTON_LEFT_FACE_DOWN
	GAMEPAD_BUTTON_LEFT_FACE_LEFT

	// This normally corresponds with PlayStation and Xbox controllers
	// XBOX: [Y,X,A,B]
	// PS3: [Triangle,Square,Cross,Circle]
	// No support for 6 button controllers though..
	GAMEPAD_BUTTON_RIGHT_FACE_UP
	GAMEPAD_BUTTON_RIGHT_FACE_RIGHT
	GAMEPAD_BUTTON_RIGHT_FACE_DOWN
	GAMEPAD_BUTTON_RIGHT_FACE_LEFT

	// Triggers
	GAMEPAD_BUTTON_LEFT_TRIGGER_1
	GAMEPAD_BUTTON_LEFT_TRIGGER_2
	GAMEPAD_BUTTON_RIGHT_TRIGGER_1
	GAMEPAD_BUTTON_RIGHT_TRIGGER_2

	// These are buttons in the center of the gamepad
	GAMEPAD_BUTTON_MIDDLE_LEFT     //PS3 Select
	GAMEPAD_BUTTON_MIDDLE          //PS Button/XBOX Button
	GAMEPAD_BUTTON_MIDDLE_RIGHT    //PS3 Start

	// These are the joystick press in buttons
	GAMEPAD_BUTTON_LEFT_THUMB
	GAMEPAD_BUTTON_RIGHT_THUMB

public enum GamepadAxis:
	// This is here just for error checking
	GAMEPAD_AXIS_UNKNOWN = 0

	// Left stick
	GAMEPAD_AXIS_LEFT_X
	GAMEPAD_AXIS_LEFT_Y

	// Right stick
	GAMEPAD_AXIS_RIGHT_X
	GAMEPAD_AXIS_RIGHT_Y

	// Pressure levels for the back triggers
	GAMEPAD_AXIS_LEFT_TRIGGER      // [1..-1] (pressure-level)
	GAMEPAD_AXIS_RIGHT_TRIGGER     // [1..-1] (pressure-level)

// Shader location points
public enum ShaderLocationIndex:
	LOC_VERTEX_POSITION = 0
	LOC_VERTEX_TEXCOORD01
	LOC_VERTEX_TEXCOORD02
	LOC_VERTEX_NORMAL
	LOC_VERTEX_TANGENT
	LOC_VERTEX_COLOR
	LOC_MATRIX_MVP
	LOC_MATRIX_MODEL
	LOC_MATRIX_VIEW
	LOC_MATRIX_PROJECTION
	LOC_VECTOR_VIEW
	LOC_COLOR_DIFFUSE
	LOC_COLOR_SPECULAR
	LOC_COLOR_AMBIENT
	LOC_MAP_ALBEDO          // LOC_MAP_DIFFUSE
	LOC_MAP_METALNESS       // LOC_MAP_SPECULAR
	LOC_MAP_NORMAL
	LOC_MAP_ROUGHNESS
	LOC_MAP_OCCLUSION
	LOC_MAP_EMISSION
	LOC_MAP_HEIGHT
	LOC_MAP_CUBEMAP
	LOC_MAP_IRRADIANCE
	LOC_MAP_PREFILTER
	LOC_MAP_BRDF
	LOC_MAP_DIFFUSE  = LOC_MAP_ALBEDO
	LOC_MAP_SPECULAR = LOC_MAP_METALNESS

// Shader uniform data types
public enum ShaderUniformDataType:
	UNIFORM_FLOAT = 0
	UNIFORM_VEC2
	UNIFORM_VEC3
	UNIFORM_VEC4
	UNIFORM_INT
	UNIFORM_IVEC2
	UNIFORM_IVEC3
	UNIFORM_IVEC4
	UNIFORM_SAMPLER2D

// Material maps
public enum MaterialMapType:
	MAP_ALBEDO    = 0       // MAP_DIFFUSE
	MAP_METALNESS = 1       // MAP_SPECULAR
	MAP_NORMAL    = 2
	MAP_ROUGHNESS = 3
	MAP_OCCLUSION
	MAP_EMISSION
	MAP_HEIGHT
	MAP_CUBEMAP             // NOTE: Uses GL_TEXTURE_CUBE_MAP
	MAP_IRRADIANCE          // NOTE: Uses GL_TEXTURE_CUBE_MAP
	MAP_PREFILTER           // NOTE: Uses GL_TEXTURE_CUBE_MAP
	MAP_BRDF
	MAP_DIFFUSE     = MAP_ALBEDO
	MAP_SPECULAR    = MAP_METALNESS

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
public enum PixelFormat:
	UNCOMPRESSED_GRAYSCALE = 1     // 8 bit per pixel (no alpha)
	UNCOMPRESSED_GRAY_ALPHA        // 8*2 bpp (2 channels)
	UNCOMPRESSED_R5G6B5            // 16 bpp
	UNCOMPRESSED_R8G8B8            // 24 bpp
	UNCOMPRESSED_R5G5B5A1          // 16 bpp (1 bit alpha)
	UNCOMPRESSED_R4G4B4A4          // 16 bpp (4 bit alpha)
	UNCOMPRESSED_R8G8B8A8          // 32 bpp
	UNCOMPRESSED_R32               // 32 bpp (1 channel - float)
	UNCOMPRESSED_R32G32B32         // 32*3 bpp (3 channels - float)
	UNCOMPRESSED_R32G32B32A32      // 32*4 bpp (4 channels - float)
	COMPRESSED_DXT1_RGB            // 4 bpp (no alpha)
	COMPRESSED_DXT1_RGBA           // 4 bpp (1 bit alpha)
	COMPRESSED_DXT3_RGBA           // 8 bpp
	COMPRESSED_DXT5_RGBA           // 8 bpp
	COMPRESSED_ETC1_RGB            // 4 bpp
	COMPRESSED_ETC2_RGB            // 4 bpp
	COMPRESSED_ETC2_EAC_RGBA       // 8 bpp
	COMPRESSED_PVRT_RGB            // 4 bpp
	COMPRESSED_PVRT_RGBA           // 4 bpp
	COMPRESSED_ASTC_4x4_RGBA       // 8 bpp
	COMPRESSED_ASTC_8x8_RGBA       // 2 bpp

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
public enum TextureFilterMode:
	FILTER_POINT = 0               // No filter, just pixel aproximation
	FILTER_BILINEAR                // Linear filtering
	FILTER_TRILINEAR               // Trilinear filtering (linear with mipmaps)
	FILTER_ANISOTROPIC_4X          // Anisotropic filtering 4x
	FILTER_ANISOTROPIC_8X          // Anisotropic filtering 8x
	FILTER_ANISOTROPIC_16X         // Anisotropic filtering 16x

// Texture parameters: wrap mode
public enum TextureWrapMode:
	WRAP_REPEAT = 0        	// Repeats texture in tiled mode
	WRAP_CLAMP             	// Clamps texture to edge pixel in tiled mode
	WRAP_MIRROR_REPEAT     	// Mirrors and repeats the texture in tiled mode
	WRAP_MIRROR_CLAMP       // Mirrors and clamps to border the texture in tiled mode

// Cubemap layouts
public enum CubemapLayoutType:
	CUBEMAP_AUTO_DETECT = 0        // Automatically detect layout type
	CUBEMAP_LINE_VERTICAL          // Layout is defined by a vertical line with faces
	CUBEMAP_LINE_HORIZONTAL        // Layout is defined by an horizontal line with faces
	CUBEMAP_CROSS_THREE_BY_FOUR    // Layout is defined by a 3x4 cross with cubemap faces
	CUBEMAP_CROSS_FOUR_BY_THREE    // Layout is defined by a 4x3 cross with cubemap faces
	CUBEMAP_PANORAMA               // Layout is defined by a panorama image (equirectangular map)

// Texture parameters: wrap mode
public enum TextureWrapMode:
	WRAP_REPEAT = 0        // Repeats texture in tiled mode
	WRAP_CLAMP             // Clamps texture to edge pixel in tiled mode
	WRAP_MIRROR_REPEAT     // Mirrors and repeats the texture in tiled mode
	WRAP_MIRROR_CLAMP      // Mirrors and clamps to border the texture in tiled mode

// Font type, defines generation method
public enum FontType:
	FONT_DEFAULT = 0       // Default font generation, anti-aliased
	FONT_BITMAP            // Bitmap font generation, no anti-aliasing
	FONT_SDF               // SDF font generation, requires external shader

// Color blending modes (pre-defined)
public enum BlendMode:
	BLEND_ALPHA = 0        // Blend textures considering alpha (default)
	BLEND_ADDITIVE         // Blend textures adding colors
	BLEND_MULTIPLIED       // Blend textures multiplying colors
	BLEND_ADD_COLORS       // Blend textures adding colors (alternative)
	BLEND_SUBTRACT_COLORS  // Blend textures subtracting colors (alternative)
	BLEND_CUSTOM           // Belnd textures using custom src/dst factors (use SetBlendModeCustom())
		
// Gestures type
// NOTE: It could be used as flags to enable only some gestures
public enum GestureType:
	GESTURE_NONE        = 0
	GESTURE_TAP         = 1
	GESTURE_DOUBLETAP   = 2
	GESTURE_HOLD        = 4
	GESTURE_DRAG        = 8
	GESTURE_SWIPE_RIGHT = 16
	GESTURE_SWIPE_LEFT  = 32
	GESTURE_SWIPE_UP    = 64
	GESTURE_SWIPE_DOWN  = 128
	GESTURE_PINCH_IN    = 256
	GESTURE_PINCH_OUT   = 512

// Camera system modes
public enum CameraMode:
	CAMERA_CUSTOM = 0
	CAMERA_FREE
	CAMERA_ORBITAL
	CAMERA_FIRST_PERSON
	CAMERA_THIRD_PERSON

// Camera projection modes
public enum CameraType:
	CAMERA_PERSPECTIVE = 0
	CAMERA_ORTHOGRAPHIC

// N-patch types
public enum NPatchType:
	NPT_9PATCH = 0         // Npatch defined by 3x3 tiles
	NPT_3PATCH_VERTICAL    // Npatch defined by 1x3 tiles
	NPT_3PATCH_HORIZONTAL  // Npatch defined by 3x1 tiles

//------------------------------------------------------------------------------------
// Global Variables Definition
//------------------------------------------------------------------------------------
// It's lonely here...

//------------------------------------------------------------------------------------
// Window and Graphics Device Functions (Module: core)
//------------------------------------------------------------------------------------
// Callback delegate used in SetTraceLogCallback to allow for custom logging
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TraceLogCallback(logType as TraceLogType, text as string, args as IntPtr) as int:
	pass

// Window-related functions
// Initialize window and OpenGL context
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def InitWindow(width as int, height as int, title as string):
	pass

// Check if KEY_ESCAPE pressed or Close icon pressed
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def WindowShouldClose() as bool:
	pass

// Close window and unload OpenGL context
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CloseWindow():
	pass

// Check if window has been initialized successfully
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsWindowReady() as bool:
	pass

// Check if window is currently minimized (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsWindowMinimized() as bool:
	pass
	
// Check if window is currently maximized (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsWindowMaximized() as bool:
	pass

// Check if window is currently focused (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsWindowFocused() as bool:
	pass

// Check if window has been resized last frame
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsWindowResized() as bool:
	pass

// Check if one specific window flag is enabled
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsWindowState(flag as uint) as bool:
	pass

// Set window configuration state using flags
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetWindowState(flags as uint):
	pass

// Clear window configuration state flags
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ClearWindowState(flags as uint):
	pass

// Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MaximizeWindow():
	pass

// Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MinimizeWindow():
	pass

// Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def RestoreWindow():
	pass

// Check if window is currently hidden (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsWindowHidden() as bool:
	pass

// Check if window is currently fullscreen	
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsWindowFullscreen() as bool:
	pass

// Toggle fullscreen mode (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ToggleFullscreen():
	pass

// Set icon for window (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetWindowIcon(image as Image):
	pass

// Set title for window (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetWindowTitle(title as string):
	pass

// Set window position on screen (only PLATFORM_DESKTOP)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetWindowPosition(x as int, y as int):
	pass

// Set monitor for the current window (fullscreen mode)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetWindowMonitor(monitor as int):
	pass

// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetWindowMinSize(width as int, height as int):
	pass

// Set window dimensions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetWindowSize(width as int, height as int):
	pass

// Get native window handle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetWindowHandle() as IntPtr:
	pass

// Get current screen width
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetScreenWidth() as int:
	pass

// Get current screen height
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetScreenHeight() as int:
	pass

// Get number of connected monitors
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMonitorCount() as int:
	pass

// Get specified monitor position
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMonitorPosition(monitor as int) as Vector2:
	pass

// Get specified monitor width
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMonitorWidth(monitor as int):
	pass

// Get specified monitor height
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMonitorHeight(monitor as int):
	pass

// Get specified monitor physical width in millimetres
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMonitorPhysicalWidth(monitor as int):
	pass

// Get specified monitor physical height in millimetres
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMonitorPhysicalHeight(monitor as int):
	pass

// Get window position XY on monitor
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetWindowPosition() as Vector2:
	pass

// Get the human-readable, UTF-8 encoded name of the specified monitor
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMonitorName(monitor as int) as string:
	pass

// Get clipboard text content
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetClipboardText() as string:
	pass

// Set clipboard text content
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetClipboardText(text as string):
	pass

// Cursor-related functions
// Shows cursor
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ShowCursor():
	pass

// hides cursor
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def HideCursor():
	pass

// Check if cursor is not visible
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsCursorHidden() as bool:
	pass

// Enables cursor (unlock cursor)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EnableCursor():
	pass

// Disables cursor (lock cursor)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DisableCursor():
	pass

// Drawing-related functions
// Set background color (framebuffer clear color)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ClearBackground(color as Color):
	pass

// Setup canvas (framebuffer) to start drawing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginDrawing():
	pass

// End canvas drawing and swap buffers (double buffering)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EndDrawing():
	pass

// Initialize 2D mode with custom camera (2D)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginMode2D(camera as Camera2D):
	pass

// Ends 2D mode with custom camera
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EndMode2D():
	pass

// Initializes 3D mode with custom camera (3D)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginMode3D(camera as Camera):
	pass

// Initializes 3D mode with custom camera (3D)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginMode3D(camera as Camera3D):
	pass
	
// Ends 3D mode and returns to default 2D orthographic mode
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EndMode3D():
	pass

// Initializes render texture for drawing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginTextureMode(target as RenderTexture2D):
	pass

// Initializes render texture for drawing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginTextureMode(target as RenderTexture):
	pass
	
// Ends drawing to render texture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EndTextureMode():
	pass

// Begin scissor mode (define screen area for following drawing)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginScissorMode(x as int, y as int, width as int, height as int):
	pass

// End scissor mode
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EndScissorMode():
	pass

// Screen-space-related functions
// Returns a ray trace from mouse position
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMouseRay(mousePosition as Vector2, camera as Camera) as Ray:
	pass

// Screen-space-related functions
// Returns a ray trace from mouse position
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMouseRay(mousePosition as Vector2, camera as Camera3D) as Ray:
	pass
	
// Returns camera transform matrix (view matrix)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCameraMatrix(camera as Camera) as Matrix:
	pass

// Returns camera transform matrix (view matrix)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCameraMatrix(camera as Camera3D) as Matrix:
	pass
	
// Returns camera 2d transform matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCameraMatrix2D(camera as Camera2D) as Matrix:
	pass

// Returns the screen space position for a 3d world space position
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetWorldToScreen(position as Vector3, camera as Camera) as Vector2:
	pass

// Returns the screen space position for a 3d world space position
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetWorldToScreen(position as Vector3, camera as Camera3D) as Vector2:
	pass

// Returns size position for a 3d world space position
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetWorldToScreenEx(position as Vector3, camera as Camera, width as int, height as int) as Vector2:
	pass

// Returns size position for a 3d world space position
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetWorldToScreenEx(position as Vector3, camera as Camera3D, width as int, height as int) as Vector2:
	pass

// Returns the screen space position for a 2d camera world space position
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetWorldToScreen2D(position as Vector2, camera as Camera2D) as Vector2:
	pass

// Returns the world space position for a 2d camera screen space position
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetScreenToWorld2D(position as Vector2, camera as Camera2D) as Vector2:
	pass

// Timing-related functions
// Set target FPS (maximum)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetTargetFPS(fps as int):
	pass

// Returns current FPS
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetFPS() as int:
	pass

// Returns time in seconds for last frame drawn
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetFrameTime() as single:
	pass

// Returns elapsed time in seconds since InitWindow()
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetTime() as double:
	pass

// Color-related functions
// Returns hexadecimal value for a Color
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ColorToInt(color as Color) as int:
	pass

// Returns color normalized as float [0..1]
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ColorNormalize(color as Color) as Vector4:
	pass
	
// Returns color from normalized values [0..1]
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ColorFromNormalized(normalized as Vector4) as Color:
	pass

// Returns color from normalized values [0..1]
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ColorFromNormalized(normalized as Quaternion) as Color:
	pass
	
// Returns HSV values for a Color
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ColorToHSV(color as Color) as Vector3:
	pass

// Returns a Color from HSV values
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ColorFromHSV(hue as single, saturation as single, value as single) as Color:
	pass

// Returns a Color struct from hexadecimal value
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetColor(hexValue as int) as Color:
	pass

// Color fade-in or fade-out, alpha goes from 0.0f to 1.0f
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Fade(color as Color, alpha as single) as Color:
	pass

// Misc. functions
// Setup init configuration flags (view FLAGS)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetConfigFlags(flags as uint) as int:
	pass
	
// Set the current threshold (minimum) log level
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetTraceLogLevel(logType as int):
	pass

// Set the exit threshold (minimum) log level
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetTraceLogExit(logType as int):
	pass

// Set a trace log callback to enable custom logging
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetTraceLogCallback(callback as int):
	pass

// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TraceLog(logType as int, text as string):
	pass

// Internal memory allocator
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MemAlloc(size as int) as IntPtr:
	pass

// Internal memory free
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MemFree(ptr as IntPtr):
	pass
	
// Takes a screenshot of current screen (saved a .png)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TakeScreenshot(fileName as string):
	pass

// Returns a random value between min and max (both included)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetRandomValue(min as int, max as int) as int:
	pass

// Files management functions
// Load file data as byte array (read)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadFileData(fileName as string, ref bytesRead as IntPtr) as (byte):
	pass

// Unload file data allocated by LoadFileData()
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadFileData(data as IntPtr):
	pass

// Save data to file from byte array (write), returns true on success
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SaveFileData(fileName as string, data as IntPtr, bytesToWrite as uint) as bool:
	pass

// Load text data from file (read), returns a '\0' terminated string
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadFileText(fileName as string) as string:
	pass

// Unload file text data allocated by LoadFileText()
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadFileText(text as string):
	pass

// Save text data to file (write), string must be '\0' terminated, returns true on success
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SaveFileText(fileName as string, text as string) as bool:
	pass

// Check if file exists
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def FileExists(fileName as string) as bool:
	pass

// Check file extension (including point: .png, .wav)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsFileExtension(fileName as string, ext as string) as bool:
	pass

// Check if a directory path exists
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DirectoryExists(dirPath as string) as bool:
	pass

// Get pointer to extension for a filename string (including point: ".png")
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetFileExtension(fileName as string) as string:
	pass

// Get pointer to filename for a path string
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetFileName(filePath as string) as string:
	pass

// Get filename string without extension (uses static string)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetFileNameWithoutExt(ref filePath as string):
	pass

// Get full path for a given fileName with path (uses static string)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetDirectoryPath(filePath as string) as string:
	pass

// Get previous directory path for a given path (uses static string)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetPrevDirectoryPath(dirPath as string) as string:
	pass

// Get current working directory (uses static string)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetWorkingDirectory() as string:
	pass

// Get filenames in a directory path (memory should be freed)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetDirectoryFiles(dirPath as string, ref count as int) as (string):
	pass

// Clear directory files paths buffers (free memory)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ClearDirectoryFiles():
	pass

// Change working directory, return true on success
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ChangeDirectory(dir as string) as bool:
	pass

// Check if a file has been dropped into window
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsFileDropped() as bool:
	pass

// Get dropped files names (memory should be freed)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetDroppedFiles(ref count as int) as IntPtr:
	pass

// Clear dropped files paths buffer (free memory)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ClearDroppedFiles():
	pass

// Get file modification time (last write time)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetFileModTime(fileName as string) as long:
	pass

// Compress data (DEFLATE algorithm)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CompressData(ref data as (byte), dataLength as int, ref compDataLength as int) as (byte):
	pass

// Decompress data (DEFLATE algorithm)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DecompressData(ref compData as (byte), ref compDataLength as int, ref dataLength as int) as (byte):
	pass

// Persistent storage management
// Save integer value to storage file (to defined position), returns true on success
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SaveStorageValue(position as uint, value as int) as bool:
	pass

// Load integer value from storage file (from defined position)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadStorageValue(position as uint) as int:
	pass

// Open URL with default system browser (if available)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def OpenURL(url as string):
	pass

//------------------------------------------------------------------------------------
// Input Handling Functions (Module: core)
//------------------------------------------------------------------------------------

// Input-related functions: keyboard
// Detect if a key has been pressed once
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsKeyPressed(key as int) as bool:
	pass

// Detect if a key is being pressed
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsKeyDown(key as int) as bool:
	pass

// Detect if a key has been released once
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsKeyReleased(key as int) as bool:
	pass

// Detect if a key is NOT being pressed
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsKeyUp(key as int) as bool:
	pass

// Set a custom key to exit program (default is ESC)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetExitKey(key as int):
	pass

// Get key pressed (keycode), call it multiple times for keys queued
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetKeyPressed() as int:
	pass

// Get char pressed (unicode), call it multiple times for chars queued
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCharPressed() as int:
	pass

// Get char pressed (unicode), call it multiple times for chars queued
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCharPressed() as char:
	pass

// Input-related functions: gamepads
// Detect if a gamepad is available
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsGamepadAvailable(gamepad as int) as bool:
	pass

// Check gamepad name (if available)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsGamepadName(gamepad as int, name as string) as bool:
	pass

// Return gamepad internal name id
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGamepadName(gamepad as int) as string:
	pass

// Detect if a gamepad button has been pressed once
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsGamepadButtonPressed(gamepad as int, button as int) as bool:
	pass

// Detect if a gamepad button is being pressed
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsGamepadButtonDown(gamepad as int, button as int) as bool:
	pass
	
// Detect if a gamepad button has been released once
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsGamepadButtonReleased(gamepad as int, button as int) as bool:
	pass

// Detect if a gamepad button is NOT being pressed
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsGamepadButtonUp(gamepad as int, button as int) as bool:
	pass

// Get the last gamepad button pressed
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGamepadButtonPressed() as int:
	pass

// Return gamepad axis count for a gamepad
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGamepadAxisCount(gamepad as int) as int:
	pass

// Return axis movement value for a gamepad axis
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGamepadAxisMovement(gamepad as int, axis as int) as single:
	pass

// Input-related functions: mouse
// Detect if a mouse button has been pressed once
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsMouseButtonPressed(button as int) as bool:
	pass

// Detect if a mouse button is being pressed
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsMouseButtonDown(button as int) as bool:
	pass

// Detect if a mouse button has been released once
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsMouseButtonReleased(button as int) as bool:
	pass

// Detect if a mouse button is NOT being pressed
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsMouseButtonUp(button as int) as bool:
	pass

// Returns mouse position X
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMouseX() as int:
	pass

// Returns mouse position Y
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMouseY() as int:
	pass

// Returns mouse position XY
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMousePosition() as Vector2:
	pass

// Set mouse position XY
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMousePosition(x as int, y as int):
	pass

// Set mouse offset
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMouseOffset(offsetX as int, offsetY as int):
	pass

// Set mouse scaling
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMouseScale(scaleX as single, scaleY as single):
	pass

// Returns mouse wheel movement Y
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMouseWheelMove() as float:
	pass

// Returns mouse cursor if (MouseCursor enum)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMouseCursor() as int:
	pass

// Set mouse cursor
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMouseCursor(cursor as int):
	pass
	
// Input-related functions: touch
// Returns touch position X for touch point 0 (relative to screen size)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetTouchX() as int:
	pass

// Returns touch position Y for touch point 0 (relative to screen size)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetTouchY() as int:
	pass

// Returns touch position XY for a touch point index (relative to screen size)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetTouchPosition(index as int) as Vector2:
	pass

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: gestures)
//------------------------------------------------------------------------------------
// Enable a set of gestures using flags
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetGesturesEnabled(gestureFlags as uint):
	pass

// Check if a gesture have been detected
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsGestureDetected(gesture as int) as bool:
	pass

// Get latest detected gesture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGestureDetected() as int:
	pass

// Get touch points count
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetTouchPointsCount() as int:
	pass

// Get gesture hold time in milliseconds
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGestureHoldDuration() as single:
	pass

// Get gesture drag vector
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGestureDragVector() as Vector2:
	pass

// Get gesture drag angle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGestureDragAngle() as single:
	pass

// Get gesture pinch delta
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGesturePinchVector() as Vector2:
	pass

// Get gesture pinch angle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGesturePinchAngle() as single:
	pass

//------------------------------------------------------------------------------------
// Camera System Functions (Module: camera)
//------------------------------------------------------------------------------------
// Set camera mode (multiple camera modes available)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetCameraMode(camera as Camera, mode as int):
	pass
	
// Set camera mode (multiple camera modes available)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetCameraMode(camera as Camera3D, mode as int):
	pass

// Update camera position for selected mode
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UpdateCamera(ref camera as Camera):
	pass

// Update camera position for selected mode
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UpdateCamera(ref camera as Camera3D):
	pass

// Set camera pan key to combine with mouse movement (free camera)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetCameraPanControl(keyPan as int):
	pass

// Set camera alt key to combine with mouse movement (free camera)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetCameraAltControl(keyAlt as int):
	pass
	
// Set camera smooth zoom key to combine with mouse (free camera)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetCameraSmoothZoomControl(keySmoothZoom as int):
	pass

// Set camera move controls (1st person and 3rd person cameras)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetCameraMoveControls(keyFront as int, keyBack as int, keyRight as int, keyLeft as int, keyUp as int, keyDown as int):
	pass

//------------------------------------------------------------------------------------
// Basic Shapes Drawing Functions (Module: shapes)
//------------------------------------------------------------------------------------

// Basic shapes drawing functions
// Draw a pixel
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawPixel(posX as int, PosY as int, color as Color):
	pass

// Draw a pixel (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawPixelV(position as Vector2, color as Color):
	pass

// Draw a line
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawLine(startPosX as int, startPosY as int, endPosX as int, endPosY as int):
	pass

// Draw a line (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawLineV(startPos as Vector2, endPos as Vector2):
	pass

// Draw a line defining thickness
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawLineEx(startPos as Vector2, endPos as Vector2, thick as single, color as Color):
	pass

// Draw a line using cubic-bezier curves in-out
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawLineBezier(startPos as Vector2, endPos as Vector2, thick as single, color as Color):
	pass

// Draw lines sequence
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawLineStrip(ref points as Vector2, pointsCount as int, color as Color):
	pass

// Draw a color-filled circle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCircle(centerX as int, centerY as int, radius as single, color as Color):
	pass

// Draw a piece of a circle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCircleSector(center as Vector2, radius as single, startAngle as int, endAngle as int, segments as int, color as Color):
	pass

// Draw circle sector outline
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCircleSectorLines(center as Vector2, radius as single, startAngle as int, endAngle as int, segments as int, color as Color):
	pass
	
// Draw a gradient-filled circle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCircleGradient(centerX as int, centerY as int, radius as single, color1 as Color, color2 as Color):
	pass

// Draw a color-filled circle (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCircleV(center as Vector2, radius as single, color as Color):
	pass

// Draw circle outline
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCircleLines(centerX as int, centerY as int, radius as single, color as Color):
	pass

// Draw ellipse
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawEllipse(centerX as int, centerY as int, radiusH as single, radiusV as single, color as Color):
	pass

// Draw ellipse outline
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawEllipseLines(centerX as int, centerY as int, radiusH as single, radiusV as single, color as Color):
	pass

// Draw ring
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRing(center as Vector2, innerRadius as single, outerRadius as single, startAngle as int, endAngle as int, segments as int, color as Color):
	pass

// Draw ring outline
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRingLines(center as Vector2, innerRadius as single, outerRadius as single, startAngle as int, endAngle as int, segments as int, color as Color):
	pass
	
// Draw a color-filled rectangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangle(posX as int, posY as int, width as int, height as int, color as Color):
	pass

// Draw a color-filled rectangle (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangleV(position as Vector2, size as Vector2, color as Color):
	pass

// Draw a color-filled rectangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangleRec(rec as Rectangle, color as Color):
	pass

// Draw a color-filled rectangle with pro parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectanglePro(rec as Rectangle, origin as Vector2, rotation as single, color as Color):
	pass

// Draw a vertical-gradient-filled rectangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangleGradientV(posX as int, posY as int, width as int, height as int, color1 as Color, color2 as Color):
	pass

// Draw a horizontal-gradient-filled rectangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangleGradientH(posX as int, posY as int, width as int, height as int, color1 as Color, color2 as Color):
	pass

// Draw a gradient-filled rectangle with custom vertex colors
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangleGradientEx(rec as Rectangle, col1 as Color, col2 as Color, col3 as Color, col4 as Color):
	pass

// Draw rectangle outline
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangleLines(posX as int, posY as int, width as int, height as int, color as Color):
	pass

// Draw rectangle outline with extended parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangleLinesEx(rec as Rectangle, lineThick as int, color as Color):
	pass

// Draw rectangle with rounded edges
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangleRounded(rec as Rectangle, roundness as single, segments as int, color as Color):
	pass

// Draw rectangle with rounded edges outline
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRectangleRounded(rec as Rectangle, roundness as single, segments as int, lineThick as int, color as Color):
	pass

// Draw a color-filled triangle (vertex in counter-clockwise order!)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTriangle(v1 as Vector2, v2 as Vector2, v3 as Vector2, color as Color):
	pass

// Draw triangle outline (vertex in counter-clockwise order!)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTriangleLines(v1 as Vector2, v2 as Vector2, v3 as Vector2, color as Color):
	pass

// Draw a triangle fan defined by points (first vertex is the center)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTriangleFan(ref points as Vector2, pointsCount as int, color as Color):
	pass

// Draw a triangle strip defined by points
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTriangleStrip(ref points as Vector2, pointsCount as int, color as Color):
	pass

// Draw a regular polygon (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawPoly(center as Vector2, sides as int, radius as single, rotation as single, color as Color):
	pass

// Draw a polygon outline of n sides
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawPolyLines(center as Vector2, sides as int, radius as single, rotation as single, color as Color):
	pass

// Basic shapes collision detection functions
// Check collision between two rectangles
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionRecs(rec1 as Rectangle, rec2 as Rectangle) as bool:
	pass

// Check collision between two circles
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionCircles(center1 as Vector2, radius1 as single, center2 as Vector2, radius2 as single) as bool:
	pass

// Check collision between circle and rectangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionCircleRec(center as Vector2, radius as single, rec as Rectangle) as bool:
	pass

// Get collision rectangle for two rectangles collision
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCollisionRec(rec1 as Rectangle, rec2 as Rectangle) as Rectangle:
	pass

// Check if point is inside rectangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionPointRec(point as Vector2, rec as Rectangle) as bool:
	pass

// Check if point is inside circle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionPointCircle(point as Vector2, center as Vector2, radius as single) as bool:
	pass

// Check if point is inside a triangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionPointTriangle(point as Vector2, p1 as Vector2, p2 as Vector2, p3 as Vector2) as bool:
	pass

// Check the collision between two lines defined by two points each, returns collision point by reference
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionLines(startPos1 as Vector2, endPos1 as Vector2, startPos2 as Vector2, endPos2 as Vector2, ref collisionPoint as Vector2) as bool:
	pass

//------------------------------------------------------------------------------------
// Texture Loading and Drawing Functions (Module: textures)
//------------------------------------------------------------------------------------

// Image loading functions
// NOTE: This functions do not require GPU access
// Load image from file into CPU memory (RAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadImage(fileName as string) as Image:
	pass

// Load image from memory buffer, fileType refers to extension: i.e. "png"
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadImageFromMemory(fileType as string, fileData as IntPtr, dataSize as int) as Image:
	pass

// Load image from Color array data (RGBA - 32bit)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadImageEx(pixels as (Color), width as int, height as int) as Image:
	pass

// Load image from raw data with parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadImagePro(data as IntPtr, width as int, height as int, format as int) as Image:
	pass

// Load image from RAW file data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadImageRaw(fileName as string, width as int, height as int, format as int, headerSize as int) as Image:
	pass

// Unload image from CPU memory (RAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadImage(image as Image):
	pass

// Export image data to file, returns true on success
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ExportImage(image as Image, fileName as string) as bool:
	pass

// Export image as code file defining an array of bytes, returns true on success
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ExportImageAsCode(image as Image, fileName as string) as bool:
	pass

// Get pixel data from image as a Color struct array
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetImageData(image as Image) as IntPtr:
	pass

// Get pixel data from image as Vector4 array (float normalized)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetImageDataNormalized(image as Image) as IntPtr:
	pass

// Image generation functions
// Generate image: plain color
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenImageColor(width as int, height as int, color as Color) as Image:
	pass

// Generate image: vertical gradient
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenImageGradientV(width as int, height as int, top as Color, bottom as Color) as Image:
	pass

// Generate image: horizontal gradient
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenImageGradientH(width as int, height as int, left as Color, right as Color) as Image:
	pass

// Generate image: radial gradient
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenImageGradientRadial(width as int, height as int, density as single, inner as Color, outer as Color) as Image:
	pass

// Generate image: checked
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenImageChecked(width as int, height as int, checksX as int, checksY as int, col1 as Color, col2 as Color) as Image:
	pass

// Generate image: white noise
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenImageWhiteNoise(width as int, height as int, factor as single) as Image:
	pass

// Generate image: perlin noise
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenImagePerlinNoise(width as int, height as int, offsetX as int, offsetY as int, scale as single) as Image:
	pass

// Generate image: cellular algorithm. Bigger tileSize means bigger cells
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenImageCellular(width as int, height as int, tileSize as int) as Image:
	pass

// Image manipulation functions
// Create an image duplicate (useful for transformations)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageCopy(image as Image) as Image:
	pass

// Create an image from another image piece
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageFromImage(image as Image, rec as Rectangle) as Image:
	pass

// Create an image from text (default font)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageText(text as string, fontSize as int, color as Color) as Image:
	pass

// Create an image from text (custom sprite font)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageTextEx(font as Font, text as string, fontSize as single, spacing as single, tint as Color) as Image:
	pass

// Create an image from text (custom sprite font)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageTextEx(font as SpriteFont, text as string, fontSize as single, spacing as single, tint as Color) as Image:
	pass

// Convert image to POT (power-of-two)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageToPOT(ref image as Image, fillColor as Color):
	pass

// Convert image data to desired format
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageFormat(ref image as Image, newFormat as int):
	pass

// Apply alpha mask to image
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageAlphaMask(ref image as Image, alphaMask as Image):
	pass

// Clear alpha channel to desired color
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageAlphaClear(ref image as Image, color as Color, threshold as single):
	pass

// Crop image depending on alpha value
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageAlphaCrop(ref image as Image, threshold as single):
	pass

// Premultiply alpha channel
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageAlphaPremultiply(ref image as Image):
	pass

// Crop an image to a defined rectangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageCrop(ref image as Image, crop as Rectangle):
	pass

// Resize image (Bicubic scaling algorithm)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageResize(ref image as Image, newWidth as int, newHeight as int):
	pass

// Resize image (Nearest-Neighbor scaling algorithm)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageResizeNN(ref image as Image, newWidth as int, newHeight as int):
	pass

// Resize canvas and fill with color
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageResizeCanvas(ref image as Image, newWidth as int, newHeight as int, offsetX as int, offsetY as int, color as Color):
	pass

// Generate all mipmap levels for a provided image
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageMipmaps(ref image as Image):
	pass

// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDither(ref image as Image, rBpp as int, gBpp as int, bBpp as int, aBpp as int):
	pass

// Flip image vertically
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageFlipVertical(ref image as Image):
	pass

// Flip image horizontally
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageFlipHorizontal(ref image as Image):
	pass

// Rotate image clockwise 90deg
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageRotateCW(ref image as Image):
	pass

// Rotate image counter-clockwise 90deg
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageRotateCCW(ref image as Image):
	pass

// Modify image color: tint
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageColorTint(ref image as Image, color as Color):
	pass

// Modify image color: invert
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageColorInvert(ref image as Image):
	pass

// Modify image color: grayscale
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageColorGrayscale(ref image as Image):
	pass

// Modify image color: contrast (-100 to 100)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageColorContrast(ref image as Image, contrast as single):
	pass

// Modify image color: brightness (-255 to 255)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageColorBrightness(ref image as Image, brightness as int):
	pass

// Modify image color: replace color
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageColorReplace(ref image as Image, color as Color, replace as Color):
	pass

// Extract color palette from image to maximum size (memory should be freed)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageExtractPalette(image as Image, maxPaletteSize as int, ref extractCount as int) as IntPtr:
	pass

// Get image alpha border rectangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetImageAlphaBorder(image as Image, threshold as single) as Rectangle:
	pass

// Image drawing functions
// NOTE: Image software-rendering functions (CPU)
// Clear image background with given color
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageClearBackground(ref dst as Image, color as Color):
	pass

// Draw pixel within an image
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawPixel(ref dst as Image, posX as int, posY as int, color as Color):
	pass

// Draw pixel within an image (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawPixelV(ref dst as Image, position as Vector2, color as Color):
	pass

// Draw line within an image
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawLine(ref dst as Image, startPosX as int, startPosY as int, endPosX as int, endPosY as int, color as Color):
	pass

// Draw line within an image (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawLineV(ref dst as Image, start as Vector2, end as Vector2, color as Color):
	pass

// Draw circle within an image
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawCircle(ref dst as Image, centerX as int, centerY as int, radius as int, color as Color):
	pass

// Draw circle within an image (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawCircleV(ref dst as Image, center as Vector2, radius as int, color as Color):
	pass

// Draw rectangle within an image
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawRectangle(ref dst as Image, posX as int, posY as int, width as int, height as int, color as Color):
	pass

// Draw rectangle within an image (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawRectangle(ref dst as Image, position as Vector2, size as Vector2, color as Color):
	pass

// Draw rectangle within an image
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawRectangleRec(ref dst as Image, rec as Rectangle, color as Color):
	pass

// Draw rectangle lines within an image
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawRectangleLines(ref dst as Image, rec as Rectangle, thick as int, color as Color):
	pass

// Draw a source image within a destination image (tint applied to source)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDraw(ref dst as Image, src as Image, srcRec as Rectangle, dstRec as Rectangle, tint as Color):
	pass

// Draw text (default font) within an image (destination)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawText(ref dst as Image, position as Vector2, text as string, fontSize as int, tint as Color):
	pass

// Draw text (custom sprite font) within an image (destination)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawTextEx(ref dst as Image, position as Vector2, font as Font, text as string, fontSize as single, spacing as single, tint as Color):
	pass

// Draw text (custom sprite font) within an image (destination)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ImageDrawTextEx(ref dst as Image, position as Vector2, font as SpriteFont, text as string, fontSize as single, spacing as single, tint as Color):
	pass
	
// Texture loading functions
// NOTE: These functions require GPU access
// Load texture from file into GPU memory (VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadTexture(fileName as string) as Texture2D:
	pass

// Load texture from image data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadTextureFromImage(image as Image) as Texture2D:
	pass

// Load cubemap from image, multiple image cubemap layouts supported
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadTextureCubemap(image as Image, layoutType as int) as TextureCubemap:
	pass

// Load texture for rendering (framebuffer)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadRenderTexture(width as int, height as int) as RenderTexture2D:
	pass
	
// Unload texture from GPU memory (VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadTexture(texture as Texture2D):
	pass

// Unload render texture from GPU memory (VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadRenderTexture(target as RenderTexture2D):
	pass

// Unload render texture from GPU memory (VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadRenderTexture(target as RenderTexture):
	pass
	
// Update GPU texture with new data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UpdateTexture(texture as Texture2D, pixels as IntPtr):
	pass

// Get pixel data from GPU texture and return an Image
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetTextureData(texture as Texture2D) as Image:
	pass

// Get pixel data from screen buffer and return an Image (screenshot)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetScreenData() as Image:
	pass

// Texture configuration functions
// Generate GPU mipmaps for a texture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenTextureMipmaps(ref texture as Texture2D):
	pass

// Set texture scaling filter mode
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetTextureFilter(texture as Texture2D, filterMode as int):
	pass

// Set texture wrapping mode
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetTextureWrap(texture as Texture2D, wrapMode as int):
	pass

// Texture drawing functions
// Draw a Texture2D
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTexture(texture as Texture2D, posX as int, posY as int, tint as Color):
	pass

// Draw a Texture2D with position defined as Vector2
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextureV(texture as Texture2D, position as Vector2, tint as Color):
	pass

// Draw a Texture2D with extended parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextureEx(texture as Texture2D, position as Vector2, rotation as single, scale as single, tint as Color):
	pass

// Draw a part of a texture defined by a rectangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextureRec(texture as Texture2D, source as Rectangle, position as Vector2, tint as Color):
	pass

// Draw texture quad with tiling and offset parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextureQuad(texture as Texture2D, tiling as Vector2, offset as Vector2, quad as Rectangle, tint as Color):
	pass

// Draw a part of a texture defined by a rectangle with 'pro' parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTexturePro(texture as Texture2D, source as Rectangle, dest as Rectangle, origin as Vector2, rotation as single, tint as Color):
	pass

// Draw part of a texture (defined by a rectangle) with rotation and scale tiled into dest.
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextureTiled(texture as Texture2D, source as Rectangle, dest as Rectangle, origin as Vector2, rotation as single, scale as single, tint as Color):
	pass

// Draws a texture (or part of it) that stretches or shrinks nicely
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextureNPatch(texture as Texture2D, nPatchInfo as NPatchInfo, dest as Rectangle, origin as Vector2, rotation as single, tint as Color):
	pass

// Image/Texture misc functions
// Get pixel data size in bytes (image or texture)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetPixelDataSize(width as int, height as int, format as int) as int:
	pass

//------------------------------------------------------------------------------------
// Font Loading and Text Drawing Functions (Module: text)
//------------------------------------------------------------------------------------

// Font loading/unloading functions
// Get the default Font
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetFontDefault() as Font:
	pass
	
// Load font from file into GPU memory (VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadFont(fileName as string) as Font:
	pass

// Load font from memory buffer, fileType refers to extension: i.e. "ttf
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadFontFromMemory(fileType as string, fileData as (byte), dataSize as int, fontSize as int, ref fontChars as int, charsCount as int) as Font:
	pass

// Unload font chars info data (RAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadFontData(ref chars as CharInfo, charsCount as int):
	pass

// Load font from file with extended parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadFontEx(fileName as string, fontSize as int, fontChars as (int), charsCount as int) as Font:
	pass
	
// Load font from Image (XNA style)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadFontFromImage(image as Image, key as Color, firstChar as int) as Font:
	pass

// Load font data for further use
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadFontData(fileName as string, fontSize as int, fontChars as (int), charsCount as int, type as int) as IntPtr:
	pass

// Generate image font atlas using chars info
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenImageFontAtlas(chars as IntPtr, ref recs as IntPtr, charsCount as int, fontSize as int, padding as int, packMethod as int) as Image:
	pass

// Unload Font from GPU memory (VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadFont(font as Font):
	pass

// Unload Font from GPU memory (VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadFont(font as SpriteFont):
	pass
	
// Text drawing functions
// Shows current FPS
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawFPS(posX as int, posY as int):
	pass

// Draw text (using default font)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawText(text as string, posX as int, posY as int, fontSize as int, color as Color):
	pass

// Draw text using font and additional parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextEx(font as Font, text as string, position as Vector2, fontSize as single, spacing as single, tint as Color):
	pass

// Draw text using font and additional parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextEx(font as SpriteFont, text as string, position as Vector2, fontSize as single, spacing as single, tint as Color):
	pass
	
// Draw text using font inside rectangle limits
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextRec(font as Font, text as string, rec as Rectangle, fontSize as single, spacing as single, wordWrap as bool, tint as Color):
	pass

// Draw text using font inside rectangle limits
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextRec(font as SpriteFont, text as string, rec as Rectangle, fontSize as single, spacing as single, wordWrap as bool, tint as Color):
	pass
	
// Draw text using font inside rectangle limits with support for text selection
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextRecEx(font as Font, text as string, rec as Rectangle, fontSize as single, spacing as single, wordWrap as bool, tint as Color, selectStart as int, selectLength as int, selectTint as Color, selectBackTint as Color):
	pass

// Draw text using font inside rectangle limits with support for text selection
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextRecEx(font as SpriteFont, text as string, rec as Rectangle, fontSize as single, spacing as single, wordWrap as bool, tint as Color, selectStart as int, selectLength as int, selectTint as Color, selectBackTint as Color):
	pass

// Draw one character (codepoint)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextCodepoint(font as Font, codepoint as int, position as Vector2, scale as single, tint as Color):
	pass

// Draw one character (codepoint)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawTextCodepoint(font as SpriteFont, codepoint as int, position as Vector2, fontSize as single, tint as Color):
	pass
	
// Text misc. functions
// Measure string width for default font
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MeasureText(text as string, fontSize as int) as int:
	pass

// Measure string size for Font
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MeasureTextEx(font as Font, text as string, fontSize as single, spacing as single) as Vector2:
	pass

// Measure string size for Font
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MeasureTextEx(font as SpriteFont, text as string, fontSize as single, spacing as single) as Vector2:
	pass
	
// Get index position for a unicode character on font
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGlyphIndex(font as Font, codepoint as int) as int:
	pass

// Get index position for a unicode character on font
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetGlyphIndex(font as SpriteFont, codepoint as int) as int:
	pass
	
// Text strings management functions (no utf8 strings, only byte chars)
// NOTE: Some strings allocate memory internally for returned strings, just be careful!
// Copy one string to another, returns bytes copied
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextCopy(dst as string, src as string) as int:
	pass

// Check if two text string are equal
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextIsEqual(text1 as string, text2 as string) as bool:
	pass

// Get text length, checks for '\0' ending
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextLength(text as string) as uint:
	pass

// Text formatting with variables (sprintf style)
// DEV NOTES: If this failed...Use string.Format instead!
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextFormat(text as string) as string:
	pass

// Get a piece of a text string
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextSubtext(text as string, position as int, length as int) as string:
	pass

// Replace text string (memory must be freed!)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextReplace(text as string, replace as string, by as string) as string:
	pass

// Insert text in a position (memory must be freed!)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextInsert(text as string, insert as string, position as int) as string:
	pass

// Join text strings with delimiter
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextJoin(textList as (string), count as int, delimiter as string) as string:
	pass

// Split text into multiple strings
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextSplit(text as string, delimiter as char, ref count as int) as (string):
	pass

// Append text at specific position and move cursor!
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextAppend(text as string, append as string, ref position as int):
	pass

// Find first text occurrence within a string
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextFindIndex(text as string, find as string) as int:
	pass

// Get upper case version of provided string
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextToUpper(text as string) as string:
	pass

// Get lower case version of provided string
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextToLower(text as string) as string:
	pass

// Get Pascal case notation version of provided string
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextToPascal(text as string) as string:
	pass

// Get integer value from text (negative values not supported)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextToInteger(text as string) as int:
	pass

// Encode text codepoint into utf8 text (memory must be freed!)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def TextToUtf8(ref codepoints as int, length as int) as string:
	pass

// UTF8 text strings management functions
// Get all codepoints in a string, codepoints count returned by parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCodepoints(text as string, ref count as int) as (int):
	pass

// Get total number of characters (codepoints) in a UTF8 encoded string
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCodepointsCount(text as string) as int:
	pass

// Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetNextCodepoint(text as string, ref bytesProcessed as int) as int:
	pass

// Encode codepoint into utf8 text (char array length returned as parameter)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CodepointToUtf8(codepoint as int, ref byteLength as int) as string:
	pass

//------------------------------------------------------------------------------------
// Basic 3d Shapes Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Basic geometric 3D shapes drawing functions
// Draw a line in 3D world space
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawLine3D(startPos as Vector3, endPos as Vector3, color as Color):
	pass

// Draw a point in 3D space, actually a small line
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawPoint3D(position as Vector3, color as Color):
	pass

// Draw a circle in 3D world space
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCircle3D(center as Vector3, radius as single, rotationAxis as Vector3, rotationAngle as single, color as Color):
	pass

// Draw cube
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCube(position as Vector3, width as single, height as single, length as single, color as Color):
	pass

// Draw cube (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCubeV(position as Vector3, size as Vector3, color as Color):
	pass

// Draw cube wires
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCubeWires(position as Vector3, width as single, height as single, length as single, color as Color):
	pass

// Draw cube wires (Vector version)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCubeWiresV(position as Vector3, size as Vector3, color as Color):
	pass

// Draw cube textured
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCubeTexture(texture as Texture2D, position as Vector3, width as single, height as single, length as single, color as Color):
	pass

// Draw sphere
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawSphere(centerPos as Vector3, radius as single, color as Color):
	pass

// Draw sphere with extended parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawSphereEx(centerPos as Vector3, radius as single, rings as int, slices as int, color as Color):
	pass

// Draw sphere wires
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawSphereWires(centerPos as Vector3, radius as single, rings as int, slices as int, color as Color):
	pass

// Draw a cylinder/cone
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCylinder(position as Vector3, radiusTop as single, radiusBottom as single, height as single, slices as int, color as Color):
	pass

// Draw a cylinder/cone wires
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawCylinderWires(position as Vector3, radiusTop as single, radiusBottom as single, height as single, slices as int, color as Color):
	pass

// Draw a plane XZ
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawPlane(centerPos as Vector3, size as Vector2, color as Color):
	pass

// Draw a ray line
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawRay(ray as Ray, color as Color):
	pass

// Draw a grid (centered at (0, 0, 0))
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawGrid(slices as int, spacing as single):
	pass

// Draw simple gizmo
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawGizmo(position as Vector3):
	pass  

//DrawTorus(), DrawTeapot() could be useful?

//------------------------------------------------------------------------------------
// Model 3d Loading and Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Model loading/unloading functions
// Load model from files (meshes and materials)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadModel(fileName as string) as Model:
	pass

// Load model from generated mesh (default material)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadModelFromMesh(mesh as Mesh) as Model:
	pass

// Unload model (including meshes) from memory (RAM and/or VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadModel(model as Model):
	pass

// Unload model (but not meshes) from memory (RAM and/or VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadModelKeepMeshes(model as Model):
	pass

// Mesh loading/unloading functions
// Load meshes from model file
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadMeshes(fileName as string, ref meshCount as int) as (Mesh):
	pass

// Export mesh data to file, returns true on success
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ExportMesh(mesh as Mesh, fileName as string) as bool:
	pass

// Unload mesh from memory (RAM and/or VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadMesh(mesh as Mesh):
	pass

// Material loading/unloading functions
// Load materials from model file
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadMaterials(fileName as string, ref materialCount as int) as (Material):
	pass

// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadMaterialDefault() as Material:
	pass

// Unload material from GPU memory (VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadMaterial(material as Material):
	pass

// Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMaterialTexture(ref material as Material, mapType as int, texture as Texture2D):
	pass

// Set material for a mesh
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetModelMeshMaterial(ref model as Model, meshId as int, materialId as int):
	pass

// Model animations loading/unloading functions
// Load model animations from file
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadModelAnimations(fileName as string, ref animsCount as int) as (ModelAnimation):
	pass

// Update model animation pose
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UpdateModelAnimation(model as Model, anim as ModelAnimation, frame as int):
	pass

// Unload animation data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadModelAnimation(anim as ModelAnimation):
	pass

// Check model animation skeleton match
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsModelAnimationValid(model as Model, anim as ModelAnimation) as bool:
	pass

// Mesh generation functions
// Generate polygonal mesh
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshPoly(sides as int, radius as single) as Mesh:
	pass

// Generate plane mesh (with subdivisions)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshPlane(width as single, length as single, resX as int, resZ as int) as Mesh:
	pass

// Generate cuboid mesh
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshCube(width as single, height as single, length as single) as Mesh:
	pass

// Generate sphere mesh (standard sphere)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshSphere(radius as single, rings as int, slices as int) as Mesh:
	pass

// Generate half-sphere mesh (no bottom cap)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshHemiSphere(radius as single, rings as int, slices as int) as Mesh:
	pass

// Generate cylinder mesh
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshCylinder(radius as single, height as single, slices as int) as Mesh:
	pass

// Generate torus mesh
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshTorus(radius as single, size as single, radSeg as int, sides as int) as Mesh:
	pass

// Generate trefoil knot mesh
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshKnot(radius as single, size as single, radSeg as int, sides as int) as Mesh:
	pass

// Generate heightmap mesh from image data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshHeightmap(heightmap as Image, size as Vector3) as Mesh:
	pass

// Generate cubes-based map mesh from image data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenMeshCubicmap(cubicmap as Image, cubeSize as Vector3) as Mesh:
	pass

// Mesh manipulation functions
// Compute mesh bounding box limits
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MeshBoundingBox(mesh as Mesh) as BoundingBox:
	pass

// Compute mesh tangents
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MeshTangents(ref mesh as Mesh):
	pass

// Compute mesh binormals
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MeshBinormals(ref mesh as Mesh):
	pass

// Model drawing functions
// Draw a model (with texture if set)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawModel(model as Model, position as Vector3, scale as single, tint as Color):	
	pass

// Draw a model with extended parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawModelEx(model as Model, position as Vector3, rotationAxis as Vector3, rotationAngle as single, scale as Vector3, tint as Color):
	pass

// Draw a model wires (with texture if set)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawModelWires(model as Model, position as Vector3, scale as single, tint as Color):	
	pass

// Draw a model wires (with texture if set) with extended parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawModelWiresEx(model as Model, position as Vector3, rotationAxis as Vector3, rotationAngle as single, scale as Vector3, tint as Color):
	pass

// Draw bounding box (wires)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawBoundingBox(box as BoundingBox, color as Color):
	pass

// Draw a billboard texture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawBillboard(camera as Camera, texture as Texture2D, center as Vector3, size as single, tint as Color):
	pass

// Draw a billboard texture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawBillboard(camera as Camera3D, texture as Texture2D, center as Vector3, size as single, tint as Color):
	pass
	
// Draw a billboard texture defined by source
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawBillboardRec(camera as Camera, texture as Texture2D, source as Rectangle, center as Vector3, size as single, tint as Color):
	pass

// Draw a billboard texture defined by source
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def DrawBillboardRec(camera as Camera3D, texture as Texture2D, source as Rectangle, center as Vector3, size as single, tint as Color):
	pass
	
// Collision detection functions
// Detect collision between two spheres
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionSpheres(center1 as Vector3, radius1 as single, center2 as Vector3, radius2 as single) as bool:
	pass

// Detect collision between two bounding boxes
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionBoxes(box1 as BoundingBox, box2 as BoundingBox) as bool:
	pass

// Detect collision between box and sphere
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionBoxSphere(box as BoundingBox, center as Vector3, radius as single) as bool:
	pass

// Detect collision between ray and sphere
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionRaySphere(ray as Ray, center as Vector3, radius as single) as bool:
	pass

// Detect collision between ray and sphere, returns collision point
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionRaySphereEx(ray as Ray, center as Vector3, radius as single, ref collisionPoint as Vector3) as bool:
	pass

// Detect collision between ray and box
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CheckCollisionRayBox(ray as Ray, box as BoundingBox) as bool:
	pass

// Get collision info between ray and mesh
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCollisionRayMesh(ray as Ray, mesh as Mesh, transform as Matrix) as RayHitInfo:
	pass
	
// Get collision info between ray and model
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCollisionRayModel(ray as Ray, model as Model) as RayHitInfo:
	pass

// Get collision info between ray and triangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCollisionRayTriangle(ray as Ray, p1 as Vector3, p2 as Vector3, p3 as Vector3) as RayHitInfo:
	pass

// Get collision info between ray and ground plane (Y-normal plane)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetCollisionRayGround(ray as Ray, groundHeight as single) as RayHitInfo:
	pass

//------------------------------------------------------------------------------------
// Shaders System Functions (Module: rlgl)
// NOTE: This functions are useless when using OpenGL 1.1
//------------------------------------------------------------------------------------

// Shader loading/unloading functions
// Load shader from files and bind default locations
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadShader(vsFileName as string, fsFileName as string) as Shader:
	pass

// Load shader from code strings and bind default locations
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadShaderCode(vsCode as string, fsCode as string) as Shader:
	pass

// Unload shader from GPU memory (VRAM)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadShader(shader as Shader):
	pass

// Get default shader
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetShaderDefault() as Shader:
	pass

// Get default texture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetTextureDefault() as Texture2D:
	pass

// Get texture to draw shapes
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetShapesTexture() as Texture2D:
	pass

// Get texture rectangle to draw shapes
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetShapesTextureRec() as Rectangle:
	pass

// Define default texture used to draw shapes
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetShapesTexture(texture as Texture2D, source as Rectangle):
	pass

// Shader configuration functions
// Get shader uniform location
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetShaderLocation(shader as Shader, uniformName as string) as int:
	pass

// Get shader attribute location
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetShaderLocationAttrib(shader as Shader, attribName as int) as int: 
	pass

// Set shader uniform value
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetShaderValue(shader as Shader, uniformLoc as int, value as IntPtr, uniformType as int):
	pass

// Set shader uniform value
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetShaderValue(shader as Shader, uniformLoc as int, ref value as int, uniformType as int):
	pass
	
// Set shader uniform value
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetShaderValue(shader as Shader, uniformLoc as int, ref value as single, uniformType as int):
	pass

// Set shader uniform value vector
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetShaderValueV(shader as Shader, uniformLoc as int, value as IntPtr, uniformType as int, count as int):
	pass

// Set shader uniform value (matrix 4x4)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetShaderValueMatrix(shader as Shader, uniformLoc as int, mat as Matrix):
	pass

// Set shader uniform value for texture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetShaderValueTexture(shader as Shader, uniformLoc as int, texture as Texture2D):
	pass

// Set a custom projection matrix (replaces internal projection matrix)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMatrixProjection(proj as Matrix):
	pass

// Set a custom modelview matrix (replaces internal modelview matrix)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMatrixModelview(view as Matrix):
	pass

// Get internal modelview matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMatrixModelview() as Matrix:
	pass

// Get internal projection matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMatrixProjection() as Matrix:
	pass

// Texture maps generation (PBR)
// NOTE: Required shaders should be provided
// Generate cubemap texture from 2D panorama texture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenTextureCubemap(shader as Shader, panorama as Texture2D, size as int, format as int) as TextureCubemap:
	pass

// Generate irradiance texture using cubemap data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenTextureIrradiance(shader as Shader, cubemap as TextureCubemap, size as int) as TextureCubemap:
	pass

// Generate prefilter texture using cubemap data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenTexturePrefilter(shader as Shader, cubemap as TextureCubemap, size as int) as TextureCubemap:
	pass

// Generate BRDF texture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GenTextureBRDF(shader as Shader, size as int) as Texture2D:
	pass

// Shading begin/end functions
// Begin custom shader drawing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginShaderMode(shader as Shader):
	pass

// End custom shader drawing (use default shader)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EndShaderMode():
	pass

// Begin blending mode (alpha, additive, multiplied)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginBlendMode(mode as int):
	pass

// End blending mode (reset to default: alpha blending)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EndBlendMode():
	pass


// VR control functions
// Init VR simulator for selected device parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def InitVrSimulator():
	pass

// Close VR simulator for current device
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CloseVrSimulator():
	pass

// Update VR tracking (position and orientation) and camera
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UpdateVrTracking(ref camera as Camera):
	pass

// Update VR tracking (position and orientation) and camera
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UpdateVrTracking(ref camera as Camera3D):
	pass
	
// Set stereo rendering configuration parameters
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetVrConfiguration(info as VrDeviceInfo, distortion as Shader):
	pass

// Detect if VR simulator is ready
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsVrSimulatorReady() as bool:
	pass

// Enable/Disable VR experience
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ToggleVrMode():
	pass

// Begin VR simulator stereo rendering
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def BeginVrDrawing():
	pass

// End VR simulator stereo rendering
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EndVrDrawing():
	pass

//------------------------------------------------------------------------------------
// Audio Loading and Playing Functions (Module: audio)
//------------------------------------------------------------------------------------

// Audio device management functions
// Initialize audio device and context
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def InitAudioDevice():
	pass

// Close the audio device and context
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CloseAudioDevice():
	pass

// Check if audio device has been initialized successfully
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsAudioDeviceReady() as bool:
	pass

// Set master volume (listener)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMasterVolume(volume as single):
	pass

// Wave/Sound loading/unloading functions
// Load wave data from file
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadWave(fileName as string) as Wave:
	pass

// Load wave from memory buffer, fileType refers to extension: i.e. "wav"
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadWaveFromMemory(fileType as string, fileData as (byte), dataSize as int) as Wave:
	pass

// Load sound from file
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadSound(fileName as string) as Sound:
	pass

// Load sound from wave data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadSoundFromWave(wave as Wave) as Sound:
	pass

// Update sound buffer with new data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UpdateSound(sound as Sound, data as IntPtr, samplesCount as int):
	pass

// Unload wave data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadWave(wave as Wave):
	pass

// Unload sound
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadSound(sound as Sound):
	pass

// Export wave data to file, returns true on success
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ExportWave(wave as Wave, fileName as string) as bool:
	pass

// Export wave sample data to code (.h), returns true on success
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ExportWaveAsCode(wave as Wave, fileName as string) as bool:
	pass

// Wave/Sound management functions
// Play a sound
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def PlaySound(sound as Sound):
	pass

// Stop playing a sound
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def StopSound(sound as Sound):
	pass

// Pause a sound
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def PauseSound(sound as Sound):
	pass

// Resume a paused sound
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ResumeSound(sound as Sound):
	pass

// Play a sound (using multichannel buffer pool)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def PlaySoundMulti(sound as Sound):
	pass

// Stop any sound playing (using multichannel buffer pool)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def StopSoundMulti():
	pass

// Get number of sounds playing in the multichannel
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetSoundsPlaying() as int:
	pass

// Check if a sound is currently playing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsSoundPlaying(sound as Sound) as bool:
	pass

// Set volume for a sound (1.0 is max level)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetSoundVolume(sound as Sound, volume as single):
	pass

// Set pitch for a sound (1.0 is base level)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetSoundPitch(sound as Sound, pitch as single):
	pass

// Convert wave data to desired format
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def WaveFormat(ref wave as Wave, sampleRate as int, sampleSize as int, channels as int):
	pass

// Copy a wave to a new wave
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def WaveCopy(wave as Wave) as Wave:
	pass

// Crop a wave to defined samples range
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def WaveCrop(ref wave as Wave, initSample as int, finalSample as int):
	pass

// Load samples data from wave as a floats array
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadWaveSamples(wave as Wave) as (single):
	pass

// Unload samples data loaded with LoadWaveSamples()
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadWaveSamples(ref samples as single):
	pass

// Music management functions
// Load music stream from file
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def LoadMusicStream(fileName as string) as Music:
	pass

// Unload music stream
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UnloadMusicStream(music as Music):
	pass

// Start music playing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def PlayMusicStream(music as Music):
	pass

// Updates buffers for music streaming
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UpdateMusicStream(music as Music):
	pass

// Stop music playing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def StopMusicStream(music as Music):
	pass

// Pause music playing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def PauseMusicStream(music as Music):
	pass

// Resume playing paused music
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ResumeMusicStream(music as Music):
	pass

// Check if music is playing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsMusicPlaying(music as Music) as bool:
	pass

// Set volume for music (1.0 is max level)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMusicVolume(music as Music, volume as single):
	pass

// Set pitch for a music (1.0 is base level)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMusicPitch(music as Music, pitch as single):
	pass

// Set music loop count (loop repeats)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetMusicLoopCount(music as Music, count as int):
	pass

// Get music time length (in seconds)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMusicTimeLength(music as Music) as single:
	pass

// Get current music time played (in seconds)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def GetMusicTimePlayed(music as Music) as single:
	pass

// AudioStream management functions
// Init audio stream (to stream raw audio pcm data)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def InitAudioStream(sampleRate as uint, sampleSize as uint, channels as uint) as AudioStream:
	pass

// Update audio stream buffers with data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def UpdateAudioStream(stream as AudioStream, data as IntPtr, samplesCount as int):
	pass

// Close audio stream and free memory
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def CloseAudioStream(stream as AudioStream):
	pass

// Check if any audio stream buffers requires refill
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsAudioStreamProcessed(stream as AudioStream) as bool:
	pass

// Play audio stream
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def PlayAudioStream(stream as AudioStream):
	pass

// Pause audio stream
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def PauseAudioStream(stream as AudioStream):
	pass

// Resume audio stream
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def ResumeAudioStream(stream as AudioStream):
	pass

// Check if audio stream is playing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def IsAudioStreamPlaying(stream as AudioStream) as bool:
	pass

// Stop audio stream
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def StopAudioStream(stream as AudioStream):
	pass


// Set volume for audio stream (1.0 is max level)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetAudioStreamVolume(stream as AudioStream, volume as single):
	pass

// Set pitch for audio stream (1.0 is base level)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetAudioStreamPitch(stream as AudioStream, pitch as single):
	pass

// Default size for new audio streams
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def SetAudioStreamBufferSizeDefault(size as int):
	pass

// Text formatting with variables (sprintf style)
// DEV NOTES: If this failed...Use string.Format instead!
def FormatText(text as string) as string:
	TextFormat(text)

// Get a piece of a text string
def SubText(text as string, position as int, length as int) as string:
	TextSubtext(text, position, length)

// Show the window
def ShowWindow():
	UnhideWindow()

// Load text data from file (read), returns a '\0' terminated string
def LoadText(fileName as string) as IntPtr:
	LoadFileText(fileName)

//------------------------------------------------------------------------------------
// RLGL
//------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------
// Dynamic vertex buffers (position + texcoords + colors + indices arrays)
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct VertexBuffer:
	elementsCount as int
	vCounter as int
	tcCounter as int
	cCounter as int
	
	vertices as (single)
	texcoords as (single)
	colors as (byte)
	
	indices as (uint)
	vaoId as (uint)
	
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 4)]
	vboId as (uint)
	
// Draw call type
// NOTE: Only texture changes register a new draw, other state-change-related elements are not
// used at this moment (vaoId, shaderId, matrices), raylib just forces a batch draw call if any
// of those state-change happens (this is done in core module)
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct DrawCall:
	mode as int
	vertexCount as int
	vertexAlignment as int
	textureId as uint


// RenderBatch type
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct RenderBatch:
	buffersCount as int
	currentBuffer as int
	ref vertexBuffer as VertexBuffer
	ref draws as DrawCall
	drawsCounter as int
	currentDepth as single

// VR Stereo rendering configuration for simulator
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct VrStereoConfig:
	distortionShader as Shader
	
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 2)]
	eyesProjection as (Matrix)
	
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 2)]
	eyesViewOffset as (Matrix)
	
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 4)]
	eyeViewportRight as (int)
	
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 4)]
	eyeViewportLeft as (int)

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
public enum GlVersion:
	OPENGL_11 = 1
	OPENGL_21
	OPENGL_33
	OPENGL_ES_20

public enum FramebufferAttachType:
	RL_ATTACHMENT_COLOR_CHANNEL0 = 0
	RL_ATTACHMENT_COLOR_CHANNEL1
	RL_ATTACHMENT_COLOR_CHANNEL2
	RL_ATTACHMENT_COLOR_CHANNEL3
	RL_ATTACHMENT_COLOR_CHANNEL4
	RL_ATTACHMENT_COLOR_CHANNEL5
	RL_ATTACHMENT_COLOR_CHANNEL6
	RL_ATTACHMENT_COLOR_CHANNEL7
	RL_ATTACHMENT_DEPTH = 100
	RL_ATTACHMENT_STENCIL = 200

public enum FramebufferTexType:
	RL_ATTACHMENT_CUBEMAP_POSITIVE_X = 0
	RL_ATTACHMENT_CUBEMAP_NEGATIVE_X
	RL_ATTACHMENT_CUBEMAP_POSITIVE_Y
	RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y
	RL_ATTACHMENT_CUBEMAP_POSITIVE_Z
	RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z
	RL_ATTACHMENT_TEXTURE2D = 100
	RL_ATTACHMENT_RENDERBUFFER = 200

public enum RLGL:
	// Default internal render batch limits
	DEFAULT_BATCH_BUFFER_ELEMENTS   = 8192
	DEFAULT_BATCH_BUFFERS           = 1        // Default number of batch buffers (multi-buffering)
	DEFAULT_BATCH_DRAWCALLS         = 256      // Default number of batch draw calls (by state changes: mode, texture)
	MAX_MATRIX_STACK_SIZE           = 32       // Maximum size of Matrix stack
	MAX_SHADER_LOCATIONS            = 32       // Maximum number of shader locations supported
	MAX_MATERIAL_MAPS               = 12       // Maximum number of shader maps supported

	// Texture parameters (equivalent to OpenGL defines)
	RL_TEXTURE_WRAP_S               = 0x2802      // GL_TEXTURE_WRAP_S
	RL_TEXTURE_WRAP_T               = 0x2803      // GL_TEXTURE_WRAP_T
	RL_TEXTURE_MAG_FILTER           = 0x2800      // GL_TEXTURE_MAG_FILTER
	RL_TEXTURE_MIN_FILTER           = 0x2801      // GL_TEXTURE_MIN_FILTER
	RL_TEXTURE_ANISOTROPIC_FILTER   = 0x3000      // Anisotropic filter (custom identifier)

	RL_FILTER_NEAREST               = 0x2600      // GL_NEAREST
	RL_FILTER_LINEAR                = 0x2601      // GL_LINEAR
	RL_FILTER_MIP_NEAREST           = 0x2700      // GL_NEAREST_MIPMAP_NEAREST
	RL_FILTER_NEAREST_MIP_LINEAR    = 0x2702      // GL_NEAREST_MIPMAP_LINEAR
	RL_FILTER_LINEAR_MIP_NEAREST    = 0x2701      // GL_LINEAR_MIPMAP_NEAREST
	RL_FILTER_MIP_LINEAR            = 0x2703      // GL_LINEAR_MIPMAP_LINEAR

	RL_WRAP_REPEAT                  = 0x2901      // GL_REPEAT
	RL_WRAP_CLAMP                   = 0x812F      // GL_CLAMP_TO_EDGE
	RL_WRAP_MIRROR_REPEAT           = 0x8370      // GL_MIRRORED_REPEAT
	RL_WRAP_MIRROR_CLAMP            = 0x8742      // GL_MIRROR_CLAMP_EXT

	// Matrix modes (equivalent to OpenGL)
	RL_MODELVIEW                    = 0x1700      // GL_MODELVIEW
	RL_PROJECTION                   = 0x1701      // GL_PROJECTION
	RL_TEXTURE                      = 0x1702      // GL_TEXTURE

	// Primitive assembly draw modes
	RL_LINES                        = 0x0001      // GL_LINES
	RL_TRIANGLES                    = 0x0004      // GL_TRIANGLES
	RL_QUADS                        = 0x0007      // GL_QUADS

//------------------------------------------------------------------------------------
// Functions Declaration - Matrix operations
//------------------------------------------------------------------------------------
// Choose the current matrix to be transformed
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlMatrixMode(mode as int):
	pass

// Push the current matrix to stack
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlPushMatrix():
	pass

// Pop lattest inserted matrix from stack
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlPopMatrix():
	pass

// Reset current matrix to identity matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlLoadIdentity():
	pass

// Multiply the current matrix by a translation matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlTranslatef(x as single, y as single, z as single):
	pass

// Multiply the current matrix by a rotation matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlRotatef(angleDeg as single, x as single, y as single, z as single):
	pass

// Multiply the current matrix by a scaling matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlScalef(x as single, y as single, z as single):
	pass

// Multiply the current matrix by another matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlMultMatrixf(ref matf as single):
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlFrustum(left as double, right as double, bottom as double, top as double, znear as double, zfar as double):
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlOrtho(left as double, right as double, bottom as double, top as double, znear as double, zfar as double):
	pass

// Set the viewport area
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlViewport(x as int, y as int, width as int, height as int):
	pass

//------------------------------------------------------------------------------------
// Functions Declaration - Vertex level operations
//------------------------------------------------------------------------------------
// Initialize drawing mode (how to organize vertex)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlBegin(mode as int):
	pass

// Finish vertex providing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlEnd():
	pass

// Define one vertex (position) - 2 int
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlVertex2i(x as int, y as int):
	pass

// Define one vertex (position) - 2 float
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlVertex2f(x as single, y as single):
	pass

// Define one vertex (position) - 3 float
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlVertex3f(x as single, y as single, z as single):
	pass

// Define one vertex (texture coordinate) - 2 float
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlTexCoord2f(x as single, y as single):
	pass

// Define one vertex (normal) - 3 float
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlNormal3f(x as single, y as single, z as single):
	pass

// Define one vertex (color) - 4 byte
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlColor4ub(r as byte, g as byte, b as byte, a as byte):
	pass

// Define one vertex (color) - 3 float
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlColor3f(r as single, g as single, b as single):
	pass

// Define one vertex (color) - 4 float
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlColor4f(r as single, g as single, b as single, a as single):
	pass

//------------------------------------------------------------------------------------
// Functions Declaration - OpenGL equivalent functions (common to 1.1, 3.3+, ES2)
// NOTE: This functions are used to completely abstract raylib code from OpenGL layer
//------------------------------------------------------------------------------------
// Enable texture usage
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlEnableTexture(id as uint):
	pass

// Disable texture usage
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDisableTexture():
	pass

// Set texture parameters (filter, wrap)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlTextureParameters(id as uint, param as int, value as int):
	pass

// Enable shader program usage
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlEnableShader(id as uint):
	pass

// Disable shader program usage
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDisableShader():
	pass

void rlEnableFramebuffer(unsigned int id);              // Enable render texture (fbo)
	void rlDisableFramebuffer(void);                        // Disable render texture (fbo), return to default framebuffer
	
// Enable depth test
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlEnableDepthTest():
	pass

// Disable depth test
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDisableDepthTest():
	pass

// Enable depth write
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlEnableDepthMask():
	pass

// Disable depth write
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDisableDepthMask():
	pass

// Enable backface culling
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlEnableBackfaceCulling():
	pass

// Disable backface culling
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDisableBackfaceCulling():
	pass

// Enable scissor test
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlEnableScissorTest():
	pass

// Disable scissor test
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDisableScissorTest():
	pass

// Scissor test
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlScissor(x as int, y as int, width as int, height as int):
	pass

// Enable wire mode
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlEnableWireMode():
	pass

// Disable wire mode
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDisableWireMode():
	pass

// Set the line drawing width
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlSetLineWidth(width as single):
	pass

// Get the line drawing width
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlGetLineWidth() as single:
	pass

// Enable line aliasing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlEnableSmoothLines():
	pass

// Disable line aliasing
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDisableSmoothLines():
	pass

// Clear color buffer with color
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlClearColor(r as byte, g as byte, b as byte, a as byte):
	pass

// Clear used screen buffers (color and depth)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlClearScreenBuffers():
	pass

// Update GPU buffer with new data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlUpdateBuffer(bufferId as int, data as IntPtr, dataSize as int):
	pass

// Load a new attributes buffer
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlLoadAttribBuffer(vaoId as uint, shaderLoc as int, buffer as IntPtr, size as int, dynamic as bool) as uint:
	pass

//------------------------------------------------------------------------------------
// Functions Declaration - rlgl functionality
//------------------------------------------------------------------------------------
// Initialize rlgl (buffers, shaders, textures, states)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlglInit(width as int, height as int):
	pass

// De-inititialize rlgl (buffers, shaders, textures)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlglClose():
	pass

// Update and draw default internal buffers
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlglDraw():
	pass

// Check and log OpenGL error codes
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlglCheckErrors():
	pass

// Returns current OpenGL version
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlGetVersion() as int:
	pass

// Check internal buffer overflow for a given number of vertex
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlCheckBufferLimit(vCount as int) as bool:
	pass

// Set debug marker for analysis
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlSetDebugMarker(text as string):
	pass

// Set blending mode factor and equation (using OpenGL factors)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlSetBlendMode(glSrcFactor as int, glDstFactor as int, glEquation as int):
	pass

// Load OpenGL extensions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlLoadExtensions(loader as IntPtr):
	pass

// Get world coordinates from screen coordinates
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Unproject(source as Vector3, proj as Matrix, view as Matrix) as Vector3:
	pass

// Textures data management
// Load texture in GPU
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlLoadTexture(data as IntPtr, width as int, height as int, format as int, mipmapCount as int) as uint:
	pass

// Load depth texture/renderbuffer (to be attached to fbo)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlLoadTextureDepth(width as int, height as int, useRenderBuffer as bool) as uint:
	pass

// Load texture cubemap
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlLoadTextureCubemap(data as IntPtr, size as int, format as int) as uint:
	pass

// Update GPU texture with new data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlUpdateTexture(id as uint, offsetX as int, offsetY as int, width as int, height as int, format as int, data as IntPtr):
	pass

// Get OpenGL internal formats
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlGetGlTextureFormats(format as int, ref glInternalFormat as uint, ref glFormat as uint, ref glType as uint):
	pass

// Unload texture from GPU memory
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlUnloadTexture(id as uint):
	pass

// Generate mipmap data for selected texture
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlGenerateMipmaps(ref texture as Texture2D):
	pass

// Read texture pixel data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlReadTexturePixels(texture as Texture2D) as IntPtr:
	pass

// Read screen pixel data (color buffer)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlReadScreenPixels(width as int, height as int) as (byte):
	pass

// Framebuffer management (fbo)
// Load an empty framebuffer
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlLoadFramebuffer(int width, int height) as uint:
	pass

// Attach texture/renderbuffer to a framebuffer
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlFramebufferAttach(fboId as uint, texId as uint, attachType as int, texType as int):
	pass

// Verify framebuffer is complete
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlFramebufferComplete(id as uint) as bool:
	pass

// Delete framebuffer from GPU
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlUnloadFramebuffer(id as uint):
	pass

// Vertex data management
// Upload vertex data into GPU and provided VAO/VBO ids
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlLoadMesh(ref mesh as Mesh, dynamic as bool):
	pass

// Update vertex or index data on GPU (upload new data to one buffer)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlUpdateMesh(mesh as Mesh, buffer as int, count as int):
	pass

// Update vertex or index data on GPU, at index
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlUpdateMeshAt(mesh as Mesh, buffer as int, count as int, index as int):
	pass

// Draw a 3d mesh with material and transform
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDrawMesh(mesh as Mesh, material as Material, transform as Matrix):
	pass

// Draw a 3d mesh with material and transform
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlDrawMeshInstanced(mesh as Mesh, material as Material, transforms as (Matrix), count as int):
	pass
	
// Unload mesh data from CPU and GPU
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def rlUnloadMesh(mesh as Mesh):
	pass

//------------------------------------------------------------------------------------
// raymath
//------------------------------------------------------------------------------------
// NOTE: Helper types to be used instead of array return types for *ToFloat functions
[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct float3:
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 3)]
	_v as (single)

[StructLayout(LayoutKind.Sequential, CharSet: CharSet.Ansi)]
public struct float16:
	[MarshalAs(UnmanagedType.ByValArray, SizeConst: 16)]
	_v as (single)

//----------------------------------------------------------------------------------
// Module Functions Definition - Utils math
//----------------------------------------------------------------------------------
// Clamp float value
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Clamp(value as single, min as single, max as single) as single:
	pass

// Calculate linear interpolation between two floats
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Lerp(start as single, end as single, amount as single) as single:
	pass

//----------------------------------------------------------------------------------
// Module Functions Definition - Vector2 math
//----------------------------------------------------------------------------------
// Vector with components value 0.0f
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Zero() as Vector2:
	pass

// Vector with components value 1.0f
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2One() as Vector2:
	pass

// Add two vectors (v1 + v2)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Add(v1 as Vector2, v2 as Vector2) as Vector2:
	pass

// Subtract two vectors (v1 - v2)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Subtract(v1 as Vector2, v2 as Vector2) as Vector2:
	pass

// Calculate vector length
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Length(v as Vector2) as single:
	pass

// Calculate two vectors dot product
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2DotProduct(v1 as Vector2, v2 as Vector2) as single:
	pass

// Calculate distance between two vectors
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Distance(v1 as Vector2, v2 as Vector2) as single:
	pass

// Calculate angle from two vectors in X-axis
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Angle(v1 as Vector2, v2 as Vector2) as single:
	pass

// Scale vector (multiply by value)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Scale(v as Vector2, scale as single) as Vector2:
	pass

// Multiply vector by vector
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2MultiplyV(v1 as Vector2, v2 as Vector2) as Vector2:
	pass

// Negate vector
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Negate(v as Vector2) as Vector2:
	pass

// Divide vector by a float value
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Divide(v as Vector2, div as single) as Vector2:
	pass

// Divide vector by vector
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2DivideV(v1 as Vector2, v2 as Vector2) as Vector2:
	pass

// Normalize provided vector
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Normalize(v as Vector2) as Vector2:
	pass

// Calculate linear interpolation between two vectors
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Lerp(v1 as Vector2, v2 as Vector2, amount as single) as Vector2:
	pass

// Rotate Vector by float in Degrees.
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector2Rotate(v as Vector2, degs as single) as Vector2:
	pass

//----------------------------------------------------------------------------------
// Module Functions Definition - Vector3 math
//----------------------------------------------------------------------------------
// Vector with components value 0.0f
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Zero() as Vector3:
	pass

// Vector with components value 1.0f
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3One() as Vector3:
	pass

// Add two vectors
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Add(v1 as Vector3, v2 as Vector3) as Vector3:
	pass

// Subtract two vectors
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Subtract(v1 as Vector3, v2 as Vector3) as Vector3:
	pass

// Multiply vector by scalar
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Scale(v as Vector3, scalar as single) as Vector3:
	pass

// Multiply vector by vector
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Multiply(v1 as Vector3, v2 as Vector3) as Vector3:
	pass

// Calculate two vectors cross product
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3CrossProduct(v1 as Vector3, v2 as Vector3) as Vector3:
	pass

// Calculate one vector perpendicular vector
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Perpendicular(v as Vector3) as Vector3:
	pass

// Calculate vector length
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Length(v as Vector3) as single:
	pass

// Calculate two vectors dot product
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3DotProduct(v1 as Vector3, v2 as Vector3) as single:
	pass

// Calculate distance between two vectors
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Distance(v1 as Vector3, v2 as Vector3) as single:
	pass

// Negate provided vector (invert direction)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Negate(v as Vector3) as Vector3:
	pass

// Divide vector by a float value
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Divide(v as Vector3, div as single) as Vector3:
	pass

// Divide vector by a float value
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3DivideV(v1 as Vector3, v2 as Vector3) as Vector3:
	pass

// Normalize provided vector
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Normalize(v as Vector3) as Vector3:
	pass

// Orthonormalize provided vectors
// Makes vectors normalized and orthogonal to each other
// Gram-Schmidt function implementation
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3OrthoNormalize(ref v1 as Vector3, ref v2 as Vector3):
	pass

// Transforms a Vector3 by a given Matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Transform(v as Vector3, mat as Matrix) as Vector3:
	pass
	
// Transform a vector by quaternion rotation
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3RotateByQuaternion(v as Vector3, q as Quaternion) as Vector3:
	pass

// Calculate linear interpolation between two vectors
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Lerp(v1 as Vector3, v2 as Vector3, amount as single) as Vector3:
	pass

// Calculate reflected vector to normal
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Reflect(v as Vector3, normal as Vector3) as Vector3:
	pass

// Return min value for each pair of components
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Min(v1 as Vector3, v2 as Vector3) as Vector3:
	pass

// Return max value for each pair of components
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Max(v1 as Vector3, v2 as Vector3) as Vector3:
	pass

// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
// NOTE: Assumes P is on the plane of the triangle
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3Barycenter(p as Vector3, a as Vector3, b as Vector3, c as Vector3) as Vector3:
	pass

// Returns Vector3 as float array
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def Vector3ToFloatV(v as Vector3) as float3:
	pass

//----------------------------------------------------------------------------------
// Module Functions Definition - Matrix math
//----------------------------------------------------------------------------------
// Compute matrix determinant
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixDeterminant(mat as Matrix) as single:
	pass

// Returns the trace of the matrix (sum of the values along the diagonal)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixTrace(mat as Matrix) as single:
	pass

// Transposes provided matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixTranspose(mat as Matrix) as Matrix:
	pass

// Invert provided matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixInvert(mat as Matrix) as Matrix:
	pass

// Normalize provided matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixNormalize(mat as Matrix) as Matrix:
	pass

// Returns identity matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixIdentity() as Matrix:
	pass

// Add two matrices
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixAdd(left as Matrix, right as Matrix) as Matrix:
	pass

// Subtract two matrices (left - right)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixSubtract(left as Matrix, right as Matrix) as Matrix:
	pass

// Returns translation matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixTranslate(x as single, y as single, z as single) as Matrix:
	pass

// Create rotation matrix from axis and angle
// NOTE: Angle should be provided in radians
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixRotate(axis as Vector3, angle as single) as Matrix:
	pass

// Returns xyz-rotation matrix (angles in radians)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixRotateXYZ(ang as Vector3) as Matrix:
	pass

// Returns x-rotation matrix (angle in radians)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixRotateX(angle as single) as Matrix:
	pass

// Returns y-rotation matrix (angle in radians)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixRotateY(angle as single) as Matrix:
	pass

// Returns z-rotation matrix (angle in radians)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixRotateZ(angle as single) as Matrix:
	pass

// Returns scaling matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixScale(x as single, y as single, z as single) as Matrix:
	pass

// Returns two matrix multiplication
// NOTE: When multiplying matrices... the order matters!
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixMultiply(left as Matrix, right as Matrix) as Matrix:
	pass

// Returns perspective projection matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixFrustum(left as double, right as double, bottom as double, top as double, near as double, far as double) as Matrix:
	pass

// Returns perspective projection matrix
// NOTE: Angle should be provided in radians
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixPerspective(fovy as double, aspect as double, near as double, far as double) as Matrix:
	pass

// Returns orthographic projection matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixOrtho(left as double, right as double, bottom as double, top as double, near as double, far as double) as Matrix:
	pass

// Returns camera look-at matrix (view matrix)
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixLookAt(eye as Vector3, target as Vector3, up as Vector3) as Matrix:
	pass

// Returns float array of matrix data
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def MatrixToFloatV(mat as Matrix) as float16:
	pass

//----------------------------------------------------------------------------------
// Module Functions Definition - Quaternion math
//----------------------------------------------------------------------------------
// Returns identity quaternion
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionIdentity() as Quaternion:
	pass

// Computes the length of a quaternion
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionLength(q as Quaternion) as single:
	pass

// Normalize provided quaternion
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionNormalize(q as Quaternion) as Quaternion:
	pass

// Invert provided quaternion
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionInvert(q as Quaternion) as Quaternion:
	pass

// Calculate two quaternion multiplication
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionMultiply(q1 as Quaternion, q2 as Quaternion) as Quaternion:
	pass

// Calculate linear interpolation between two quaternions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionLerp(q1 as Quaternion, q2 as Quaternion, amount as single) as Quaternion:
	pass

// Calculate slerp-optimized interpolation between two quaternions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionNlerp(q1 as Quaternion, q2 as Quaternion, amount as single) as Quaternion:
	pass

// Calculates spherical linear interpolation between two quaternions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionSlerp(q1 as Quaternion, q2 as Quaternion, amount as single) as Quaternion:
	pass

// Calculate quaternion based on the rotation from one vector to another
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionFromVector3ToVector3(fromv as Vector3, to as Vector3) as Quaternion:
	pass

// Returns a quaternion for a given rotation matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionFromMatrix(mat as Matrix) as Quaternion:
	pass

// Returns a matrix for a given quaternion
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionToMatrix(q as Quaternion) as Matrix:
	pass

// Returns rotation quaternion for an angle and axis
// NOTE: angle must be provided in radians
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionFromAxisAngle(axis as Vector3, angle as single) as Quaternion:
	pass

// Returns the rotation angle and axis for a given quaternion
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionToAxisAngle(q as Quaternion, ref outAxis as Vector3, ref outAngle as single):
	pass

// Returns he quaternion equivalent to Euler angles
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionFromEuler(roll as single, pitch as single, yaw as single) as Quaternion:
	pass

// Return the Euler angles equivalent to quaternion (roll, pitch, yaw)
// NOTE: Angles are returned in a Vector3 struct in degrees
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionToEuler(q as Quaternion) as Vector3:
	pass

// Transform a quaternion given a transformation matrix
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def QuaternionTransform(q as Quaternion, mat as Matrix) as Quaternion:
	pass

// Return float vector for Matrix
def MatrixToFloat(mat as Matrix) as (single):
	return MatrixToFloatV(mat)._v

// Return float vector for Vector3
def Vector3ToFloat(vec as Vector3) as (single):
	return Vector3ToFloatV(vec)._v

//------------------------------------------------------------------------------------
// easings
//------------------------------------------------------------------------------------
// Linear Easing functions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseLinearNone(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseLinearIn(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseLinearOut(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseLinearInOut(t as single, b as single, c as single, d as single) as single:
	pass

// Sine Easing functions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseSineIn(t as single, b as single, c as single, d as single) as single:
	pass
	
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseSineOut(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseSineInOut(t as single, b as single, c as single, d as single) as single:
	pass

// Circular Easing functions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseCircIn(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseCircOut(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseCircInOut(t as single, b as single, c as single, d as single) as single:
	pass

// Cubic Easing functions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseCubicIn(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseCubicOut(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseCubicInOut(t as single, b as single, c as single, d as single) as single:
	pass

// Quadratic Easing functions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseQuadIn(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseQuadOut(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseQuadInOut(t as single, b as single, c as single, d as single) as single:
	pass

// Exponential Easing functions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseExpoIn(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseExpoOut(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseExpoInOut(t as single, b as single, c as single, d as single) as single:
	pass

// Back Easing functions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseBackIn(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseBackOut(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseBackInOut(t as single, b as single, c as single, d as single) as single:
	pass

// Bounce Easing functions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseBounceIn(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseBounceOut(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseBounceInOut(t as single, b as single, c as single, d as single) as single:
	pass

// Elastic Easing functions
[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseElasticIn(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseElasticOut(t as single, b as single, c as single, d as single) as single:
	pass

[DllImport("raylib", CallingConvention: CallingConvention.Cdecl)]
def EaseElasticInOut(t as single, b as single, c as single, d as single) as single:
	pass
