require 'faker'

%w(watches weather disease neuroscience cats).each do |name|
  Post.create!(name: name)
end

Post.all.each do |tag|
  5.times do
    comment = Comment.create!(title:Faker::Company.catch_phrase, content: Faker::Lorem.paragraphs.join("\n\n"))
  end
end
