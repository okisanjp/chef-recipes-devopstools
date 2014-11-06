#
# Cookbook Name:: chef-recipes-devopstools
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# yumを最新に
bash 'yum update' do
	user "root"
	code <<-EOS
		yum -y update
		yum -y upgrade
	EOS
end

# 入れておきたいツール
%w{
	htop vim-enhanced git-all
}.each do |pkg|
	package pkg do
	  action :upgrade
	end
end

# yum-cronを入れておく
package "yum-cron" do
	action :upgrade
end
service "yum-cron" do
  action [ :enable, :start ]
end