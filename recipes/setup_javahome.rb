cookbook_file 'jenkins-cli.jar' do
  path '/var/lib/jenkins/jenkins-cli.jar'
  owner 'jenkins'
  action :create_if_missing
end

template '/var/lib/jenkins/setup_javahome.groovy' do
  source 'setup_javahome.groovy.erb'
  owner 'jenkins'
end

bash 'set up JAVA_HOME on each slave' do
  user 'jenkins'
  code <<-EOL
  cd /var/lib/jenkins
  java -jar jenkins-cli.jar -i #{node['devops_jenkins']['slave']['ssh_key']} -s #{node['devops_jenkins']['slave']['master_url']} groovy setup_javahome.groovy
  EOL
end
