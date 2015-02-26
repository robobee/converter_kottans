Rails.application.routes.draw do
  namespace :convert do
    get 'c2f' => 'process#c2f'
    get 'f2c' => 'process#f2c'
  end
end
