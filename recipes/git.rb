include_recipe 'apt'
package 'ant'
package 'tomcat7'
package 'tomcat7-admin'

# git:

directory "/var/lib/jenkins/.ssh" do
  mode '0755'
  owner 'jenkins'
  group 'jenkins'
  action :create
end

cookbook_file '/var/lib/jenkins/.ssh/id_rsa' do
  source 'keys/id_rsa'
  owner 'jenkins'
  group 'jenkins'
  mode 0600
end

cookbook_file '/var/lib/jenkins/.ssh/id_rsa.pub' do
  source 'keys/id_rsa.pub'
  owner 'jenkins'
  group 'jenkins'
  mode 0755
end

cookbook_file '/var/lib/jenkins/.ssh/known_hosts' do
  source 'keys/known_hosts'
  owner 'jenkins'
  group 'jenkins'
  mode 0755
end

#$ sudo su jenkins
#git config --global user.name "John Doe"
#git config --global user.email johndoe@example.com
