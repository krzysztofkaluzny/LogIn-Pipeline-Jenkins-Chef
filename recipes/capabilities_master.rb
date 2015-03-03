node['devops_jenkins']['master']['capabilities'].each do |it|
  include_recipe it
end unless node['devops_jenkins']['master']['capabilities'].empty?
