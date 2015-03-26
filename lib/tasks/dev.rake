namespace :dev do
  task :setup => [:environment] do
    User.create(name: 'Example', email: 'user@example.com', password: '12341234', password_confirmation: '12341234')
    Admin.create(email: 'admin@example.com', password: '12341234', password_confirmation: '12341234')
  end
end