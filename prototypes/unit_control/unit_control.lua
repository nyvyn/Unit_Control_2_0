local util = require("prototypes.util.tf_util")
local tools = require("shared").unit_tools
local path = util.path("graphics/unit_control/")

local unit_selection_tool =
{
  type = "selection-tool",
  name = tools.unit_selection_tool,
  localised_name = {tools.unit_selection_tool},
  select =
  {
    mode = {"same-force", "entity-with-health"},
    cursor_box_type = "copy",
    border_color = {g = 1},
    entity_filters = {}
  },
  alt_select =
  {
    mode = {"same-force", "entity-with-health"},
    cursor_box_type = "pair",
    border_color = {g = 1, b = 1},
    entity_filters = {}
  },
  reverse_select =
  {
    mode = {"entity-with-health"},
    cursor_box_type = "not-allowed",
    border_color = {a = 1}
  },
  icon = path.."unit_select.png",
  icon_size = 1,
  stack_size = 1,
  flags = {"not-stackable", "spawnable", "only-in-cursor"},
  draw_label_for_cursor_render = true,
  mouse_cursor = ""
}

local move_cursor =
{
  name = "move-cursor",
  type = "mouse-cursor",
  hot_pixel_x = 64,
  hot_pixel_y = 64,
  filename = path.."cursors/move_cursor.png"
}

local unit_move_tool =
{
  type = "selection-tool",
  name = tools.unit_move_tool,
  localised_name = {tools.unit_move_tool},
  select =
  {
    mode = {"entity-with-health"},
    cursor_box_type = "copy",
    border_color = {g = 1}
  },
  alt_select =
  {
    mode = {"entity-with-health"},
    cursor_box_type = "copy",
    border_color = {g = 1}
  },
  icon = path.."unit_move_tool.png",
  icon_size = 1,
  stack_size = 1,
  flags = {"only-in-cursor", "not-stackable", "spawnable"},
  mouse_cursor = "move-cursor"
}

local patrol_cursor =
{
  name = "patrol-cursor",
  type = "mouse-cursor",
  hot_pixel_x = 64,
  hot_pixel_y = 64,
  filename = path.."cursors/patrol_cursor.png"
}

local unit_patrol_tool =
{
  type = "selection-tool",
  name = tools.unit_patrol_tool,
  localised_name = {tools.unit_patrol_tool},
  select =
  {
    mode = {"friend", "enemy"},
    cursor_box_type = "entity",
    border_color = {a = 0}
  },
  alt_select =
  {
    mode = {"enemy", "friend"},
    cursor_box_type = "not-allowed",
    border_color = {a = 0}
  },
  icon = path.."unit_move_tool.png",
  icon_size = 1,
  stack_size = 1,
  flags = {"only-in-cursor", "not-stackable", "spawnable"},
  mouse_cursor = "patrol-cursor"
}

local move_confirm_sound =
{
  name = tools.unit_move_sound,
  type = "sound",
  filename = "__core__/sound/armor-insert.ogg",
  volume = 2
}

local attack_move_cursor =
{
  name = "attack-move-cursor",
  type = "mouse-cursor",
  hot_pixel_x = 64,
  hot_pixel_y = 64,
  filename = path.."cursors/attack_move_cursor.png"
}

local unit_attack_move_tool =
{
  type = "selection-tool",
  name = tools.unit_attack_move_tool,
  localised_name = {tools.unit_attack_move_tool},
  select =
  {
    mode = {"not-same-force", "entity-with-health"},
    cursor_box_type = "not-allowed",
    border_color = {r = 1}
  },
  alt_select =
  {
    mode = {"not-same-force", "entity-with-health"},
    cursor_box_type = "not-allowed",
    border_color = {r = 1}
  },
  icon = path.."unit_attack_move_tool.png",
  icon_size = 1,
  stack_size = 1,
  flags = {"only-in-cursor", "not-stackable", "spawnable"},
  mouse_cursor = "attack-move-cursor"
}

--[[
local unit_attack_tool =
{
  type = "selection-tool",
  name = tools.unit_attack_tool,
  localised_name = {tools.unit_attack_tool},
  select =
  {
    mode = {"enemy", "entity-with-force"},
    cursor_box_type = "not-allowed",
    border_color = {r = 1}
  },
  alt_select =
  {
    mode = {"enemy", "entity-with-force"},
    cursor_box_type = "not-allowed",
    border_color = {r = 1}
  },
  icon = path.."unit_attack_tool.png",
  icon_size = 258,
  stack_size = 1,
  flags = {"only-in-cursor", "not-stackable", "spawnable"},
}

local unit_force_attack_tool =
{
  type = "selection-tool",
  name = tools.unit_force_attack_tool,
  localised_name = {tools.unit_force_attack_tool},
  select =
  {
    mode = {"not-same-force", "entity-with-health"},
    cursor_box_type = "not-allowed",
    border_color = {r = 1}
  },
  alt_select =
  {
    mode = {"not-same-force", "entity-with-health"},
    cursor_box_type = "not-allowed",
    border_color = {r = 1}
  },
  icon = path.."unit_attack_tool.png",
  icon_size = 258,
  stack_size = 1,
  flags = {"only-in-cursor", "not-stackable", "spawnable"},
}]]

--[[local unit_follow_tool =
{
  type = "selection-tool",
  name = tools.unit_follow_tool,
  localised_name = {tools.unit_follow_tool},
  select =
  {
    mode = {"friend", "any-entity"},
    cursor_box_type = "copy",
    border_color = {g = 1}
  },
  alt_select =
  {
    mode = {"friend", "any-entity"},
    cursor_box_type = "copy",
    border_color = {g = 1}
  },
  icon = path.."unit_attack_tool.png",
  icon_size = 258,
  stack_size = 1,
  flags = {"only-in-cursor", "not-stackable", "spawnable"},
}]]

local select_units_shortcut =
{
  type = "shortcut",
  name = tools.select_units_shortcut,
  order = "y",
  action = "spawn-item",
  localised_name = {tools.unit_selection_tool},
  --technology_to_unlock = "construction-robotics",
  item_to_spawn = tools.unit_selection_tool,
  style = "blue",
  icon =
  {
    filename = path.."unit_select_shortcut.png",
    size = 128,
    priority = "extra-high-no-scale",
    flags = {"icon"}
  }
}

local selection_circle =
{
  type = "sprite",
  name = "selection-circle",
  filename = path.."selection-circle-grey.png",
  size = 418,
  draw_as_glow = true
}

data:extend{
  unit_selection_tool,
  move_confirm_sound,
  move_cursor,
  unit_move_tool,
  patrol_cursor,
  unit_patrol_tool,
  attack_move_cursor,
  unit_attack_move_tool,
  selection_circle,
  --select_units_shortcut
}
