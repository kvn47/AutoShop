module ComponentsHelper

  def component_groups_collection
    Component.groups.map { |key, _| [key, component_group_name(key)] }
  end

  def component_group_name(group)
    Component.human_attribute_name("group.#{group}")
  end
end