cmake_minimum_required(VERSION 3.10) 

project(ffplay-sp) 

set(FFMPEG_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/..)
set(FFTOOLS_SOURCE_DIR ${FFMPEG_SOURCE_DIR}/fftools)
set(FFMPEG_LOCAL_BUILD_DIR ${FFMPEG_SOURCE_DIR}/output)
set(FFMPEG_LIBS_DIR ${FFMPEG_LOCAL_BUILD_DIR}/lib)

# sdl2
find_package(SDL2 REQUIRED)
include_directories(${SDL2_INCLUDE_DIRS})

# config.h
include_directories(${FFMPEG_SOURCE_DIR})

# add the executable 
add_executable(${PROJECT_NAME} 
    ${FFTOOLS_SOURCE_DIR}/ffplay.c
    ${FFTOOLS_SOURCE_DIR}/cmdutils.h
    ${FFTOOLS_SOURCE_DIR}/cmdutils.c
    ${FFTOOLS_SOURCE_DIR}/opt_common.h
    ${FFTOOLS_SOURCE_DIR}/opt_common.c
)

target_link_libraries(${PROJECT_NAME} 
    ${FFMPEG_LIBS_DIR}/libavcodec.a
    ${FFMPEG_LIBS_DIR}/libavdevice.a
    ${FFMPEG_LIBS_DIR}/libavfilter.a
    ${FFMPEG_LIBS_DIR}/libavformat.a
    ${FFMPEG_LIBS_DIR}/libavutil.a
    ${FFMPEG_LIBS_DIR}/libswresample.a
    ${FFMPEG_LIBS_DIR}/libswscale.a
    ${SDL2_LIBRARIES}
    "-framework CoreVideo"
    "-framework CoreAudio"
    "-framework VideoToolBox"
    "-framework AVFoundation"
    "-framework AudioToolbox"
    "-framework CoreMedia"
    "-framework CoreImage"
    "-framework Metal"
    "-framework OpenGL"
    "-framework Security"
    "-framework AppKit"
    -liconv
    -llzma
    -lbz2
    -lz
    -lm
)

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 11)