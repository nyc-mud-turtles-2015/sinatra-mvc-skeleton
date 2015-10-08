require 'faker'

user = User.create(username: 'Hobbes', password: 'cat')

%w(watches weather disease neuroscience humans).each do |category|
  Post.create!(name: category)
end

Post.all.each do |post|
  5.times do
    comment = Comment.create!(content: Faker::Lorem.paragraphs.join("\n\n"))
  end
end
