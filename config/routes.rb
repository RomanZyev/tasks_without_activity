# Plugin's routes
resources :addresees do
   resources :addresees_properties
end
match 'addresees_property', :controller => 'addresees_property', :action => 'update_property', :via => [:put]

get '/without_activity/send', :controller => 'without_activity', :action => 'send'
get '/list_without_activity', :controller => 'list_without_activity', :action => 'index'
