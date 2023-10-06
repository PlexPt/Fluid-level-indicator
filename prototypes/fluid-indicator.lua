
empty_sprite = { 
  filename = "__core__/graphics/empty.png", 
  size = 1, 
  frame_count = 1 
}
fluid_level_indicator = util.table.deepcopy(data.raw["storage-tank"]["storage-tank"])
local pipe = data.raw["pipe"]["pipe"]

circuit_connector_definitions["fluid-level-indicator"] = circuit_connector_definitions.create
(
  universal_connector_template,
  {
    { variation = 4,
    main_offset = util.by_pixel(10.5, -8.5),
    shadow_offset = util.by_pixel(10.0, -0.5),
    show_shadow = true },
    { variation = 4,
    main_offset = util.by_pixel(10.5, -8.5),
    shadow_offset = util.by_pixel(10.0, -0.5),
    show_shadow = true },
    { variation = 4,
    main_offset = util.by_pixel(10.5, -8.5),
    shadow_offset = util.by_pixel(10.0, -0.5),
    show_shadow = true },
    { variation = 4,
    main_offset = util.by_pixel(10.5, -8.5),
    shadow_offset = util.by_pixel(10.0, -0.5),
    show_shadow = true }
  }
)

fluid_level_indicator.name = "fluid-level-indicator"
fluid_level_indicator.icon = "__Fluid-level-indicator__/graphics/icons/T-icon64.png"
fluid_level_indicator.icon_size = 64
fluid_level_indicator.flags = {"placeable-player", "player-creation", "placeable-neutral", "placeable-enemy"}
fluid_level_indicator.minable = {mining_time = 0.1, result = "fluid-level-indicator"}
--fluid_level_indicator.collision_box = pipe.collision_box
--fluid_level_indicator.selection_box = pipe.selection_box
fluid_level_indicator.collision_box = {{-0.32, -0.4}, {0.32, 0.4}}
fluid_level_indicator.selection_box = {{-0.5, -0.6}, {0.5, 0.6}}
fluid_level_indicator.apply_runtime_tint = true
fluid_level_indicator.corpse = "pipe-remnants"
fluid_level_indicator.dying_explosion = "pump-explosion"
fluid_level_indicator.circuit_wire_connection_points = circuit_connector_definitions["fluid-level-indicator"].points
fluid_level_indicator.circuit_connector_sprites = circuit_connector_definitions["fluid-level-indicator"].sprites
fluid_level_indicator.circuit_wire_max_distance = default_circuit_wire_max_distance
fluid_level_indicator.se_allow_in_space = true
fluid_level_indicator.water_reflection = 
{
  pictures =
  {
    filename = "__Fluid-level-indicator__/graphics/entities/fluid-level-reflection.png",
    priority = "extra-high",
    width = 24,
    height = 24,
    shift = util.by_pixel(5, 35),
    variation_count = 1,
    scale = 5
  },
  rotate = false,
  orientation_to_variation = false
}

fluid_level_indicator.fluid_box = 
{
      base_area = 1,
      base_level = 0,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} }
      },
      hide_connection_info = true
}
fluid_level_indicator.pictures = 
{
      picture =
      {
        sheets =
        {
          {
            filename = "__Fluid-level-indicator__/graphics/entities/hr-pipe-cross-screen.png",
            priority = "extra-high",
            frames = 1,
            width = 128,
            height = 128,
            scale = 0.5,
            hr_version =
            {
              filename = "__Fluid-level-indicator__/graphics/entities/hr-pipe-cross-screen.png",
              priority = "extra-high",
              frames = 1,
              width = 128,
              height = 128,
              scale = 0.5,
            }
          }
        }
      },
      gas_flow = empty_sprite,
      fluid_background = empty_sprite,
      window_background = empty_sprite,
      flow_sprite = empty_sprite
}
empty_sprite.name = "flinumber "
empty_sprite.type = "sprite"
data:extend({

{
    type = "item",
    name = "fluid-level-indicator",
    icon = "__Fluid-level-indicator__/graphics/icons/T-icon64.png",
    icon_size = 64,
    flags = {},
    subgroup = "energy-pipe-distribution",
    order = "f[fluid-level-indicator]",
    place_result = "fluid-level-indicator",
    stack_size = 50
},

fluid_level_indicator,
empty_sprite
})


