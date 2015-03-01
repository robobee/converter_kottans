Rails.application.routes.draw do
  namespace :convert do
    get 'temperature' => 'process#convert'
  end
end
