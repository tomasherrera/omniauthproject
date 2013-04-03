Omniauthproject::Application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }
  root :to => "pages#index"
  devise_scope :user do
    get 'sign_in', to: redirect("/users/auth/google_apps?approval_prompt=force"), as: :new_user_session
    get 'sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
end
