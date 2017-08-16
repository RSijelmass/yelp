Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :posts do
		resources :comments
	end

	constraints Clearance::Constraints::SignedIn.new do
    root to: "posts#index", as: :signed_in_root
  end
end
