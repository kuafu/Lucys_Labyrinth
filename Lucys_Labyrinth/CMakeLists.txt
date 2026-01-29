# App target: Lucy's Labyrinth (source layout per Makefile: main.cpp)
# Dependencies (common, llama, ggml_static, SFML) are provided by parent.

add_executable(Lucys_Labyrinth
    main.cpp
    Lucys_Labyrinth.rc
)

target_include_directories(Lucys_Labyrinth PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/llama_cpp
    ${CMAKE_SOURCE_DIR}/llama_cpp/common
)

target_compile_definitions(Lucys_Labyrinth PRIVATE
    _CRT_SECURE_NO_WARNINGS
    SFML_STATIC
)

target_link_libraries(Lucys_Labyrinth PRIVATE
    common
    llama
    ggml_static
    sfml-main
    sfml-graphics
    sfml-window
    sfml-system
    sfml-audio
)

# Windows: copy OpenAL32.dll to output if present (SFML audio dependency)
if(WIN32 AND EXISTS "${CMAKE_SOURCE_DIR}/OpenAL32.dll")
    add_custom_command(TARGET Lucys_Labyrinth POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${CMAKE_SOURCE_DIR}/OpenAL32.dll"
            $<TARGET_FILE_DIR:Lucys_Labyrinth>
    )
endif()

# Output exe to project root bin/ (flat: no bin/Release or bin/Debug)
# Debug exe name: Lucys_Labyrinth_d.exe; Release/RelWithDebInfo/MinSizeRel: Lucys_Labyrinth.exe
set_target_properties(Lucys_Labyrinth PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_SOURCE_DIR}/bin"
    RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_SOURCE_DIR}/bin"
    RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_SOURCE_DIR}/bin"
    RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL "${CMAKE_SOURCE_DIR}/bin"
    OUTPUT_NAME_DEBUG "Lucys_Labyrinth_d"
    OUTPUT_NAME_RELEASE "Lucys_Labyrinth"
    OUTPUT_NAME_RELWITHDEBINFO "Lucys_Labyrinth"
    OUTPUT_NAME_MINSIZEREL "Lucys_Labyrinth"
    VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
)
