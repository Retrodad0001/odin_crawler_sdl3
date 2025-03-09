package crawler

import "base:runtime"
import "core:c"
import "core:log"
import "core:mem"

import box "vendor:box2d"
import sdl "vendor:sdl3"

//CONSTANTS
SCREEN_WIDTH: int : 1920
SCREEN_HEIGHT: int : 1080

g_ctx: runtime.Context

main :: proc() {

	context.logger = log.create_console_logger(.Debug)
	g_ctx = context

	track: mem.Tracking_Allocator
	mem.tracking_allocator_init(&track, context.allocator)
	context.allocator = mem.tracking_allocator(&track)

	defer {
		if len(track.allocation_map) > 0 {
			log.warn("=== %v allocations not freed: ===\n", len(track.allocation_map))
			for _, entry in track.allocation_map {
				log.warn("- %v bytes @ %v\n", entry.size, entry.location)
			}
		}
		if len(track.bad_free_array) > 0 {
			log.warn("=== %v incorrect frees: ===\n", len(track.bad_free_array))
			for entry in track.bad_free_array {
				log.warn("- %p @ %v\n", entry.memory, entry.location)
			}
		}
		mem.tracking_allocator_destroy(&track)
	}

	//TODD add picture in readme

}

update :: proc() {

}

draw :: proc() {
}
