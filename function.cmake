function(fooKeyword country city)
    message("Address: ${country} ${city}")
endfunction()

# Command to generate debug symbols in a seperate file
function(generate_debug_symbols target)
    message("target argument is ${target}")
    get_target_property(target_type ${target} TYPE)
    message("target_type value is ${target_type}")
    if(target_type STREQUAL SHARED_LIBRARY OR target_type STREQUAL EXECUTABLE)
        message("after check ${target_type}")
        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} --only-keep-debug $<TARGET_FILE:${target}> $<TARGET_FILE:${target}>.debug
            COMMAND ${CMAKE_STRIP} --strip-unneeded $<TARGET_FILE:${target}>
            COMMAND ${CMAKE_OBJCOPY} --add-gnu-debuglink=$<TARGET_FILE:${target}>.debug $<TARGET_FILE:${target}>
            COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${target}>
        )
    endif()
    message("CMAKE SIZE is ${CMAKE_SIZE}")
endfunction()