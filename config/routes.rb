GalerieApi::Application.routes.draw do

  get '/auth/:provider/callback' => "session#create", :defaults => { :format => 'json' }
  get '/auth/failure'            => "session#failure", :defaults => { :format => 'json' }
  get '/auth/logout'             => "session#destroy", :as => :signout, :defaults => { :format => 'json' }

  scope '/api' do
    get '/tag/reduce' => "tag#reduce", :defaults => { :format => 'json' }
    get '/tag/:id'    => "tag#show", :defaults => { :format => 'json' }
    resources :user, only: [:index, :show, :create, :update, :destroy], :defaults => { :format => 'json' }
    resources :bucket, only: [:index, :show, :create, :update, :destroy], :defaults => { :format => 'json' }
    resources :picture, only: [:index, :show, :create, :update, :destroy], :defaults => { :format => 'json' }
  end

  %w( 404 422 500 ).each do |code|
    get code, :to => "error#show", :code => code, :defaults => { :format => 'json' }
  end

end
