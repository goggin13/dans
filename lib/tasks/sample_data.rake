namespace :sample_data do
  task :populate => :environment do
    Blog.destroy_all
    15.times do |i|
      content = (0..4).map { Faker::Lorem.paragraph(5) }.join("  \n\n  ")
      blog = Blog.create! title: "Episode #{i + 1}",
        content: content,
        published: true
      puts "created #{blog.id}"
    end
  end
end
