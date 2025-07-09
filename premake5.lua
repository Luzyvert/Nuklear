project "Nuklear"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/**.c", "src/**.h", "nuklear.h", "nuklear_sdl_renderer.h"
    }

    buildoptions {
        "-include nuklear_platform.h"
    }

    includedirs
    {
        "../allegro/include"
    }

    filter "system:windows"
        systemversion "latest"
		libdirs
		{
			"../allegro/lib",
			"../SDL2/lib/x64"
		}

		links 
		{
			"../SDL2/lib/x64/SDL2.lib",
			"../SDL2/lib/x64/SDL2main.lib",
			"../SDL2/lib/x64/SDL2test.lib"
		}
    
    filter "system:linux"
        pic "On"
        systemversion "latest"
        linkoptions { "-static" }
		libdirs
		{
			"../allegro/lib",
			"../SDL2/linux/lib"
		}

		links 
		{
			"../SDL2/linux/lib/libSDL2.a",
			"../SDL2/linux/lib/libSDL2.dll.a",
			"../SDL2/lib/x64/SDL2main.lib",
			"../SDL2/lib/x64/SDL2test.lib"
		}

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
