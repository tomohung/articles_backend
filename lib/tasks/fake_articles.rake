namespace :dev do

  desc "Rebuild articles"
  # task :rebuild => ["db:drop", "db:setup", :fake]

  task :fake => :environment do
      puts "Create fake data for development"

      100.times do
        Article.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph)
      end

  end
end