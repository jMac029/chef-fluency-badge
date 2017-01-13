#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#Check linux platform to determine package names
if node['platform_family'] == "rhel"
	package = "httpd"
elseif node['platform_family'] == "debian"
	package = "apache2"

end

#Install apache package
package 'apache2' do
	package_name package
	action :install
end

#Start and enable apache
service 'apache2' do
	service_name 'httpd'
	action [:start, :enable]
end

