project "Nuklear"
    kind "StaticLib"
    language "C"
    staticruntime "off"

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

    filter "system:windows"
        systemversion "latest"
    
    filter "system:linux"
        pic "On"
        systemversion "latest"

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
