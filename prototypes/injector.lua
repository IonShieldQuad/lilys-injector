local hit_effects = require("__base__/prototypes/entity/hit-effects.lua")
local sounds = require("__base__/prototypes/entity/sounds.lua")



local item = {
    type = "item",
    name = "lilys-injector-input",
    subgroup = "energy-pipe-distribution",
    order = "b[pipe]-m[injector-input]",
    icons = {
        {
            icon = "__base__/graphics/icons/pipe.png",
            icon_size = 64,
            scale = 0.5,
            tint = { 0.7, 0.7, 0.7, 0.7 }
        },
        {
            icon = "__lilys-injector__/graphics/icons/injector.png",
            icon_size = 64,
            scale = 0.5,
        },
        {
            icon = "__base__/graphics/icons/arrows/signal-input.png",
            icon_size = 64,
            tint = { 0.2, 1, 0.2, 1 },
            scale = 0.25,
            shift = { 8, -8 },
            floating = true,
        }
    },

    place_result = "lilys-injector-input",

    stack_size = 50,
    weight = 20 * kg
}

local entity = {


    subgroup = "energy-pipe-distribution",
    order = "b[pipe]-m[injector-input]",
    fast_replaceable_group = "injector",
    icons = table.deepcopy(item.icons),

    type = "assembling-machine",
    name = "lilys-injector-input",

    minable = { mining_time = 0.1, result = "lilys-injector-input" },

    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    max_health = 300,

    dying_explosion = "explosion",


    resistances =
    {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = { { -0.5, -0.99 }, { 0.5, 0.99 } },
    selection_box = { { -0.7, -1 }, { 0.7, 1.0 } },

    damaged_trigger_effect = hit_effects.entity(),

    ---@diagnostic disable-next-line: undefined-global
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    ---@diagnostic disable-next-line: undefined-global
    circuit_connector = circuit_connector_definitions["assembling-machine"],

    crafting_categories = { "injection", "crafting-with-fluid-or-injection" },
    crafting_speed = 4,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = { pollution = 1 }
    },
    energy_usage = "75kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = { "speed", "consumption", "pollution" },
    module_slots = 1,
    fluid_boxes =
    {
        {
            production_type = "input",
            ---@diagnostic disable-next-line: undefined-global
            --pipe_picture = assembler2pipepictures(),
            ---@diagnostic disable-next-line: undefined-global
            pipe_covers = pipecoverspictures(),
            always_draw_covers = true,
            volume = 1000,
            pipe_connections = {
                { flow_direction = "input-output", direction = defines.direction.north, position = { 0, -0.49 } },
                { flow_direction = "input-output", direction = defines.direction.south, position = { 0, 0.49 } },
            },
            secondary_draw_orders = { north = -1 }
        },

    },
    effect_receiver = { uses_module_effects = true, uses_beacon_effects = true, uses_surface_effects = true },
    impact_category = "metal",
    working_sound =
    {
        sound = {
            {
                filename = "__base__/sound/pump.ogg", volume = 1, audible_distance_modifier = 1
            },
            {
                filename = "__base__/sound/train-door-open.ogg",
                volume = 1,
                audible_distance_modifier = 1,
                speed = 2,
                max_speed = 10
            },
            {
                filename = "__base__/sound/train-door-close.ogg",
                volume = 1,
                audible_distance_modifier = 1,
                speed = 2,
                max_speed = 10
            }
        },
        fade_in_ticks = 4,
        fade_out_ticks = 20,
    },

    graphics_set = {
        animation = {
            north = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
                        height = 128,
                        width = 128,
                        scale = 0.5,
                        shift = util.by_pixel(0, -16),
                        repeat_count = 62,
                    },
                    {
                        filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
                        height = 128,
                        width = 128,
                        scale = 0.5,
                        shift = util.by_pixel(0, 16),
                        repeat_count = 62
                    },
                    {
                        filename = "__base__/graphics/entity/pump/pump-south.png",
                        height = 160,
                        width = 114,
                        scale = 0.25,
                        shift = util.by_pixel(18, -24),
                        line_length = 8,
                        frame_count = 32,
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/pump/pump-south.png",
                        height = 160,
                        width = 114,
                        scale = 0.25,
                        shift = util.by_pixel(-6, -24),
                        line_length = 8,
                        frame_count = 32,
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
                        height = 76,
                        width = 66,
                        scale = 0.78,
                        shift = { 0, 0 },
                        repeat_count = 62,
                        tint = { 0.8, 0.9, 0.95, 1 },
                    },
                    {
                        filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-S.png",
                        priority = "extra-high",
                        width = 88,
                        height = 61,
                        shift = util.by_pixel(0, 16),
                        scale = 0.5,
                        repeat_count = 62
                    },
                    {
                        filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W.png",
                        height = 176,
                        width = 180,
                        scale = 0.25,
                        shift = { 0, -0.6 },
                        line_length = 4,
                        frame_count = 32,
                        tint = { 0.9, 0.9, 0.8, 1 },
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
                        height = 50,
                        width = 110,
                        scale = 0.78,
                        repeat_count = 62,
                        shift = util.by_pixel(11 * 0.78 * 2, 6.5 * 0.78 * 2),
                        draw_as_shadow = true,
                    },
                    {
                        priority = "high",
                        width = 176,
                        height = 130,
                        line_length = 4,
                        shift = util.by_pixel(9, 16 * 0.6),
                        filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W-shadow.png",
                        frame_count = 32,
                        animation_speed = 0.5,
                        run_mode = "forward-then-backward",
                        draw_as_shadow = true,
                        scale = 0.25
                    }
                }
            },
            south = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
                        height = 128,
                        width = 128,
                        scale = 0.5,
                        shift = util.by_pixel(0, -16),
                        repeat_count = 62,
                    },
                    {
                        filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
                        height = 128,
                        width = 128,
                        scale = 0.5,
                        shift = util.by_pixel(0, 16),
                        repeat_count = 62
                    },
                    {
                        filename = "__base__/graphics/entity/pump/pump-south.png",
                        height = 160,
                        width = 114,
                        scale = 0.25,
                        shift = util.by_pixel(18, -24),
                        line_length = 8,
                        frame_count = 32,
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/pump/pump-south.png",
                        height = 160,
                        width = 114,
                        scale = 0.25,
                        shift = util.by_pixel(-6, -24),
                        line_length = 8,
                        frame_count = 32,
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
                        height = 76,
                        width = 66,
                        scale = 0.78,
                        shift = { 0, 0 },
                        repeat_count = 62,
                        tint = { 0.8, 0.9, 0.95, 1 },
                    },
                    {
                        filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-S.png",
                        priority = "extra-high",
                        width = 88,
                        height = 61,
                        shift = util.by_pixel(0, 16),
                        scale = 0.5,
                        repeat_count = 62,
                    },
                    {
                        filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W.png",
                        height = 176,
                        width = 180,
                        scale = 0.25,
                        shift = { 0, -0.6 },
                        line_length = 4,
                        frame_count = 32,
                        tint = { 0.9, 0.9, 0.8, 1 },
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
                        height = 50,
                        width = 110,
                        scale = 0.78,
                        repeat_count = 62,
                        shift = util.by_pixel(11 * 0.78 * 2, 6.5 * 0.78 * 2),
                        draw_as_shadow = true,
                    },
                    {
                        priority = "high",
                        width = 176,
                        height = 130,
                        line_length = 4,
                        shift = util.by_pixel(9, 16 * 0.6),
                        filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W-shadow.png",
                        frame_count = 32,
                        animation_speed = 0.5,
                        run_mode = "forward-then-backward",
                        draw_as_shadow = true,
                        scale = 0.25
                    }
                }
            },
            east = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
                        height = 128,
                        width = 128,
                        scale = 0.5,
                        shift = util.by_pixel(-16, 0),
                        repeat_count = 62
                    },
                    {
                        filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
                        height = 128,
                        width = 128,
                        scale = 0.5,
                        shift = util.by_pixel(16, 0),
                        repeat_count = 62
                    },
                    {
                        filename = "__base__/graphics/entity/pump/pump-south.png",
                        height = 160,
                        width = 114,
                        scale = 0.25,
                        shift = util.by_pixel(18, -24),
                        line_length = 8,
                        frame_count = 32,
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/pump/pump-south.png",
                        height = 160,
                        width = 114,
                        scale = 0.25,
                        shift = util.by_pixel(-6, -24),
                        line_length = 8,
                        frame_count = 32,
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
                        height = 76,
                        width = 66,
                        scale = 0.78,
                        shift = { 0, 0 },
                        repeat_count = 62,
                        tint = { 0.8, 0.9, 0.95, 1 },
                    },
                    {
                        filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W.png",
                        height = 176,
                        width = 180,
                        scale = 0.25,
                        shift = { 0, -0.6 },
                        line_length = 4,
                        frame_count = 32,
                        tint = { 0.9, 0.9, 0.8, 1 },
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
                        height = 50,
                        width = 110,
                        scale = 0.78,
                        repeat_count = 62,
                        shift = util.by_pixel(11 * 0.78 * 2, 6.5 * 0.78 * 2),
                        draw_as_shadow = true,
                    },
                    {
                        priority = "high",
                        width = 176,
                        height = 130,
                        line_length = 4,
                        shift = util.by_pixel(9, 16 * 0.6),
                        filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W-shadow.png",
                        frame_count = 32,
                        animation_speed = 0.5,
                        run_mode = "forward-then-backward",
                        draw_as_shadow = true,
                        scale = 0.25
                    }
                }
            },
            west = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
                        height = 128,
                        width = 128,
                        scale = 0.5,
                        shift = util.by_pixel(-16, 0),
                        repeat_count = 62
                    },
                    {
                        filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
                        height = 128,
                        width = 128,
                        scale = 0.5,
                        shift = util.by_pixel(16, 0),
                        repeat_count = 62
                    },
                    {
                        filename = "__base__/graphics/entity/pump/pump-south.png",
                        height = 160,
                        width = 114,
                        scale = 0.25,
                        shift = util.by_pixel(18, -24),
                        line_length = 8,
                        frame_count = 32,
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/pump/pump-south.png",
                        height = 160,
                        width = 114,
                        scale = 0.25,
                        shift = util.by_pixel(-6, -24),
                        line_length = 8,
                        frame_count = 32,
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
                        height = 76,
                        width = 66,
                        scale = 0.78,
                        shift = { 0, 0 },
                        repeat_count = 62,
                        tint = { 0.8, 0.9, 0.95, 1 },
                    },
                    {
                        filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W.png",
                        height = 176,
                        width = 180,
                        scale = 0.25,
                        shift = { 0, -0.6 },
                        line_length = 4,
                        frame_count = 32,
                        tint = { 0.9, 0.9, 0.8, 1 },
                        run_mode = "forward-then-backward"
                    },
                    {
                        filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
                        height = 50,
                        width = 110,
                        scale = 0.78,
                        repeat_count = 62,
                        shift = util.by_pixel(11 * 0.78 * 2, 6.5 * 0.78 * 2),
                        draw_as_shadow = true,
                    },
                    {
                        priority = "high",
                        width = 176,
                        height = 130,
                        line_length = 4,
                        shift = util.by_pixel(9, 16 * 0.6),
                        filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W-shadow.png",
                        frame_count = 32,
                        animation_speed = 0.5,
                        run_mode = "forward-then-backward",
                        draw_as_shadow = true,
                        scale = 0.25
                    }
                }
            },
        }

        --animation = data.raw["container"]["steel-chest"].picture
    }

}




local item2 = table.deepcopy(item)
item2.name = "lilys-injector-output"
item2.place_result = "lilys-injector-output"
item2.icons = {
    {
        icon = "__base__/graphics/icons/pipe.png",
        icon_size = 64,
        scale = 0.5,
        tint = { 0.7, 0.7, 0.7, 0.7 }
    },
    {
        icon = "__lilys-injector__/graphics/icons/injector.png",
        icon_size = 64,
        scale = 0.5,
    },
    {
        icon = "__base__/graphics/icons/arrows/signal-output.png",
        icon_size = 64,
        tint = { 1, 0.2, 0.2, 1 },
        scale = 0.25,
        shift = { 8, -8 },
        floating = true,
    }
}

item2.order = "b[pipe]-n[injector-output]"

local entity2 = table.deepcopy(entity)
entity2.name = "lilys-injector-output"
entity2.minable.result = "lilys-injector-output"

entity2.icons = table.deepcopy(item2.icons)
entity2.fluid_boxes[1].production_type = "output"
entity2.order = "b[pipe]-n[injector-output]"


local recipe = {
    type = "recipe",
    name = "lilys-injector-input",
    allow_productivity = false,
    energy_required = 5,
    ingredients = {
        { type = "item", name = "pump",                amount = 1 },
        { type = "item", name = "burner-mining-drill", amount = 1 },
        { type = "item", name = "iron-chest",          amount = 1 },
        { type = "item", name = "pipe",                amount = 10 },
        { type = "item", name = "iron-gear-wheel",     amount = 4 },
        { type = "item", name = "electronic-circuit",  amount = 4 },

    },
    results = { { type = "item", name = "lilys-injector-input", amount = 1 } }

}

local recipe2 = {
    type = "recipe",
    name = "lilys-injector-output",
    allow_productivity = false,
    energy_required = 5,
    ingredients = {
        { type = "item", name = "pump",                amount = 1 },
        { type = "item", name = "burner-mining-drill", amount = 1 },
        { type = "item", name = "iron-chest",          amount = 1 },
        { type = "item", name = "pipe",                amount = 10 },
        { type = "item", name = "iron-gear-wheel",     amount = 4 },
        { type = "item", name = "electronic-circuit",  amount = 4 },

    },
    results = { { type = "item", name = "lilys-injector-output", amount = 1 } }

}

local convert = {
    type = "recipe",
    name = "lilys-injector-to-input",
    allow_productivity = false,
    allow_quality = false,
    ingredients = {
        { type = "item", name = "lilys-injector-output", amount = 1 }

    },
    results = { { type = "item", name = "lilys-injector-input", amount = 1 } },
    auto_recycle = false,
}

local convert2 = {
    type = "recipe",
    name = "lilys-injector-to-output",
    allow_productivity = false,
    allow_quality = false,
    ingredients = {
        { type = "item", name = "lilys-injector-input", amount = 1 }

    },
    results = { { type = "item", name = "lilys-injector-output", amount = 1 } },
    auto_recycle = false,
}

data:extend({
    {
        type = "recipe-category",
        name = "injection"
    },
    {
        type = "recipe-category",
        name = "crafting-with-fluid-or-injection"
    },
    item, entity, recipe, item2, entity2, recipe2, convert, convert2
})

local tech = data.raw["technology"]["fluid-handling"]
table.insert(tech.effects, {
    type = "unlock-recipe",
    recipe = "lilys-injector-input"

})
table.insert(tech.effects, {
    type = "unlock-recipe",
    recipe = "lilys-injector-output"

})
table.insert(tech.effects, {
    type = "unlock-recipe",
    recipe = "lilys-injector-to-input"

})
table.insert(tech.effects, {
    type = "unlock-recipe",
    recipe = "lilys-injector-to-output"
})
