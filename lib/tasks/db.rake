namespace :db do
  desc "Recreate database db:drop, db:create, db:migrate, db:seed"
  task recreate: :environment do
    # list_tasks = case
    # when Rails.env.development?
    #   %w[db:drop db:create db:migrate db:seed db:test:prepare]
    # when Rails.env.staging?
    #   %w[db:drop db:create db:migrate db:seed]
    # else
    #   Array.new
    # end

    # if list_tasks.any?
    #   list_tasks.each do |task|
    #     puts "\e[36mEXECUTE #{task} COMMAND\e[0m"
    #     Rake::Task[task].invoke
    #   end
    # else
    #   puts "\e[31mdb:recreate task can be executed only in the development environment.\e[0m"
    # end

    list_tasks = %w[db:drop db:create db:migrate db:seed]
    list_tasks.each do |task|
        puts "Executing #{task}"
        Rake::Task[task].invoke
      end
  end
end
