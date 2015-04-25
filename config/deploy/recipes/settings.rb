namespace :settings do
  desc 'Setup settings.'
  task :setup do
    run "mkdir -p #{shared_path}/config/settings"

    put File.read('config/settings.local.yml'), "#{shared_path}/config/settings.yml"
    put File.read('config/settings/production.local.yml'), "#{shared_path}/config/settings/production.yml"


    run "ln -nfs #{shared_path}/config/settings.yml #{release_path}/config/settings.yml"
    run "ln -nfs #{shared_path}/config/settings/production.yml #{release_path}/config/settings/production.yml"

  end
  after 'deploy:finalize_update', 'settings:setup'
end