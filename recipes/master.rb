include_recipe 'apt'

# java:
install_flavor = node['devops_jenkins']['master']['jdk_type']
if install_flavor == 'oracle'
  node.default['java']['oracle']['accept_oracle_download_terms']  = true
end
node.default['java']['install_flavor'] = install_flavor
node.default['java']['jdk_version']    = node['devops_jenkins']['master']['jdk_version']

include_recipe 'java'

# jenkins master:
jenkins_install_method = node['devops_jenkins']['master']['jenkins_install_method']
jenkins_version        = node['devops_jenkins']['master']['jenkins_version']
node.default['jenkins']['master']['install_method'] = jenkins_install_method

if jenkins_install_method == 'war'
  node.default['jenkins']['master']['version']        = jenkins_version
  node.default['jenkins']['master']['source']         = "#{node['jenkins']['master']['mirror']}/war/1.580/jenkins.war"
end

include_recipe 'jenkins::master'

node['devops_jenkins']['master']['plugins'].each do |plg, ver|
  jenkins_plugin plg do
    version ver
  end
end

include_recipe 'devops_jenkins::capabilities_master'

service 'jenkins' do
  action :restart
end
