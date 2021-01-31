project "ImGui"
	kind "StaticLib"
	language "C++"
	toolset ("v142")

	targetdir ("bin/" .. outputDir .. "/%{prj.name}")
	objdir ("bin-temp/" .. outputDir .. "/%{prj.name}")

	files
	{
		"imconfig-SFML.h",
		"imgui-SFML.h",
		"imgui-SFML.cpp",
		"imgui-SFML_export.h"
	}

	libdirs
    {        
        "../SFML-2.0/lib",
    }


	includedirs
    {
        "../SFML-2.0/include",
        "../imgui",
        "../imgui-sfml",
    }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

		defines
        {
            "SFML_STATIC",
        }

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

		defines
        {
            "SFML_STATIC",
        }

	filter "configurations:Debug"
		buildoptions "/MDd"
		runtime "Debug"
		symbols "on"

		links
		{
			"sfml-graphics-s-d.lib",
			"sfml-window-s-d.lib",
			"sfml-system-s-d.lib",
			"opengl32.lib",
		}

	filter "configurations:Release"
		buildoptions "/MD"
		runtime "Release"
		optimize "on"

		links
		{
			"sfml-graphics-s.lib",
            "sfml-window-s.lib",
			"sfml-system-s.lib",
			"opengl32.lib",
		}

	filter "configurations:Ship"
		buildoptions "/MD"
		runtime "Release"
		optimize "On"

        links
        {
            "sfml-graphics-s.lib",
            "sfml-window-s.lib",
			"sfml-system-s.lib",
			"opengl32.lib",
		}
