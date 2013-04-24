JqmodalDemo::Application.routes.draw do
  get 'show' => 'demo#show'
  get 'submit' => 'demo#submit'
  root :to => 'demo#index'
end
