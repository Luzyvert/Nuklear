project "Nuklear"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.c", "src/**.h", "nuklear.h", "nuklear_sdl_renderer.h"
	}

    includedirs
    {
        "../allegro/include"
    }

    libdirs
    {
        "../allegro/lib",
		"../SDL2/lib/x64"
    }

    defines {
        "NK_MEMCPY=memcpy",
        "NK_MEMSET=memset",
        "NK_SQRT=sqrtf",
        "NK_STRICMP=strcasecmp",
        "NK_STRNICMP=strncasecmp",
        "NK_VSNPRINTF=vsnprintf",
        "NK_SINF=sinf",
        "NK_COSF=cosf"
    }


    links 
    {
        "../SDL2/lib/x64/SDL2.lib",
        "../SDL2/lib/x64/SDL2main.lib",
        "../SDL2/lib/x64/SDL2test.lib"
    }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
