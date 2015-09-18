
# This is probably managed better by the httpd cookbook
service 'httpd' do
  action [ :enable, :start ]
end

service 'cobblerd' do
  action [ :enable, :start ]
  notifies :run, 'execute[cobbler sync]', :delayed
end

# This is just for a hook from the config
service 'xinetd'

execute 'cobbler sync' do
	command 'sleep 5; cobbler sync'
	action :nothing
end
