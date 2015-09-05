# config valid only for current version of Capistrano
lock '3.4.0'
# 你的 application name
set :application, 'rails101s'
# 你的 git url
set :repo_url, 'https://github.com/AlvinChiou/rails101s.git'

# rbenv 的設定
set :rbenv_type, :user
set :rbenv_ruby, "2.1.2"
set :rbenv_path, "/usr/local/rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all

# deploy 的資料夾位置 (prodution)
set :deploy_to, "/home/apps/rails101s"
set :log_level, :debug
# git clone 完成後會從 shared 資料夾 copy 過去的檔案
set :linked_files, %w(config/database.yml config/secrets.yml)

# git clone 完成後會從 shared 資料夾 copy 過去的資料夾
set :linked_dirs, fetch(:linked_dirs, []).push("bin", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system")


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
         execute :rake, 'cache:clear'
      # end
    end
  end

end
