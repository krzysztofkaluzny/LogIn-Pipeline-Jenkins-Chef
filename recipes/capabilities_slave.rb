node['devops_jenkins']['slave']['capabilities'].each do |it|
  include_recipe it
end unless node['devops_jenkins']['slave']['capabilities'].empty?
