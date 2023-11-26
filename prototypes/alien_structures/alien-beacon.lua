-- ====================================================================================================
-- ALIEN BEACON
-- ====================================================================================================
data:extend({{
    name = "ei_alien-beacon",
    type = "item",
    icon = ei_graphics_item_path .. "alien-beacon.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "a1",
    place_result = "ei_alien-beacon",
    stack_size = 1
}, {
    name = "ei_alien-beacon",
    type = "beacon",
    icon = ei_graphics_item_path .. "alien-beacon.png",
    icon_size = 64,
    flags = {"player-creation", "placeable-neutral", "not-upgradable"},
    max_health = 300,
    corpse = "big-remnants",
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    map_color = ei_data.colors.alien,
    allowed_effects = {"speed", "consumption", "pollution"},
    minable = {
        mining_time = 1,
        result = "ei_alien-beacon"
    },
    distribution_effectivity = 1,
    energy_source = {
        type = "void"
    },
    energy_usage = "1W",
    module_specification = {
        module_slots = 8,
        module_info_icon_shift = {0, 0.5},
        module_info_multi_row_initial_height_modifier = -0.3
    },
    supply_area_distance = 12,
    radius_visualisation_picture = {
        filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
        width = 10,
        height = 10
    },
    animation = {
        filename = ei_graphics_entity_path .. "alien-beacon_animation.png",
        size = {512, 512},
        shift = {0, 0.5},
        scale = 0.35,
        line_length = 4,
        lines_per_file = 4,
        frame_count = 16,
        animation_speed = 0.4,
        run_mode = "backward"
    }
}, -- add destroyed beacons as containers
{
    name = "ei_alien-beacon_off-1",
    type = "item",
    icon = ei_graphics_item_path .. "alien-beacon_off.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-beacon_off-1",
    stack_size = 1
}, {
    name = "ei_alien-beacon_off-2",
    type = "item",
    icon = ei_graphics_item_path .. "alien-beacon_off.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b2",
    place_result = "ei_alien-beacon_off-2",
    stack_size = 1
}, {
    name = "ei_alien-beacon_off-3",
    type = "item",
    icon = ei_graphics_item_path .. "alien-beacon_off.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b2",
    place_result = "ei_alien-beacon_off-3",
    stack_size = 1
}, {
    name = "ei_alien-beacon_off-1",
    type = "container",
    icon = ei_graphics_item_path .. "alien-beacon_off.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation", "not-deconstructable", "not-blueprintable"},
    max_health = 300,
    corpse = "big-remnants",
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    map_color = ei_data.colors.alien,
    inventory_size = 0,
    picture = {
        filename = ei_graphics_entity_path .. "alien-beacon_off-1.png",
        size = {512, 512},
        shift = {0, 0.5},
        scale = 0.35
    }
}, {
    name = "ei_alien-beacon_off-2",
    type = "container",
    icon = ei_graphics_item_path .. "alien-beacon_off.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation", "not-deconstructable", "not-blueprintable"},
    max_health = 300,
    corpse = "big-remnants",
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    map_color = ei_data.colors.alien,
    inventory_size = 0,
    picture = {
        filename = ei_graphics_entity_path .. "alien-beacon_off-2.png",
        size = {512, 512},
        shift = {0, 0.5},
        scale = 0.35
    }
}, {
    name = "ei_alien-beacon_off-3",
    type = "container",
    icon = ei_graphics_item_path .. "alien-beacon_off.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation", "not-deconstructable", "not-blueprintable"},
    max_health = 300,
    corpse = "big-remnants",
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    map_color = ei_data.colors.alien,
    inventory_size = 0,
    picture = {
        filename = ei_graphics_entity_path .. "alien-beacon_off-3.png",
        size = {512, 512},
        shift = {0, 0.5},
        scale = 0.35
    }
}})
