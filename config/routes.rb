Rails.application.routes.draw do
  devise_for :users
  root "quizzes#index"
  resources :quizzes
  resources :quiz_questions
end
