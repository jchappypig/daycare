require 'seed-fu/capistrano'

# Trigger the task after update_code
after 'deploy:update_code', 'db:seed_fu'
