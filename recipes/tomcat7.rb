# tomcat7

cookbook_file '/etc/tomcat7/server.xml' do
  source 'tomcat7/server.xml'
  mode 0755
end

cookbook_file '/etc/tomcat7/tomcat-users.xml' do
  source 'tomcat7/tomcat-users.xml'
  mode 0755
end

service 'tomcat7' do
  action :restart
end
