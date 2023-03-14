project "bgfx"
	kind "StaticLib"
	staticruntime "on"
	language "C++"
	cppdialect "C++14"
	exceptionhandling "Off"
	rtti "Off"
	defines "__STDC_FORMAT_MACROS"
	
	targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"include/bgfx/**.h",
		"src/*.cpp",
		"src/*.h"
	}
	
	excludes
	{
		"src/amalgamated.cpp"
	}
	
	includedirs
	{
		"%{IncludeDir.bx}",
		"%{IncludeDir.bimg}",
		"%{IncludeDir.bgfx}",
		"%{IncludeDir.bgfx3rdParty}",
		"%{IncludeDir.bgfx3rdPartydxsdk}",
		"%{IncludeDir.bgfx3rdPartyKhronos}"
	}
	
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"
		excludes
		{
			"src/glcontext_glx.cpp",
			"src/glcontext_egl.cpp"
		}
	filter ""
	filter "system:linux"
		pic "on"
		debugargs { "-bgfx_backend opengl" }
	filter ""
	filter "system:macosx"
		files
		{
			"src/*.mm"
		}
		excludes
		{
			"src/amalgamated.mm"
		}
	filter ""
	setBxCompat()