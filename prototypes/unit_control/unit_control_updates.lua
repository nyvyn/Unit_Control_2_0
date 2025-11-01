local util = require("prototypes.util.tf_util")
local tools = require("shared").unit_tools
local path = util.path("graphics/unit_control/")

local selection_filter = {}

for name, prototype in pairs (data.raw["unit-spawner"]) do
  table.insert(selection_filter, name)
end

for entity_type, bool in pairs (util.entity_types()) do
  local entities = data.raw[entity_type]
  if entities then
    for name, entity in pairs (entities) do
      if entity.is_deployer then
        table.insert(selection_filter, name)
      end
    end
  end
end

local units = data.raw["unit"]
if units then
  for name, unit in pairs (units) do
    if not unit.not_controllable then
      table.insert(selection_filter, name)
    end
  end
end

local unit_tool = data.raw["selection-tool"][tools.unit_selection_tool]
if unit_tool then
  if unit_tool.select then
    unit_tool.select.entity_filters = selection_filter
  end
  if unit_tool.alt_select then
    unit_tool.alt_select.entity_filters = selection_filter
  end
end
