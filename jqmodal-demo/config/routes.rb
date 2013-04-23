JqmodalDemo::Application.routes.draw do
  get 'show' => 'demo#show'
  root :to => 'demo#index'
end
