require 'faker'

User.create(id: 1, username: 'Hobbes', password: 'cat')
User.create(id: 2,username: 'Calvin', password: 'cat')

%w(watches weather disease neuroscience humans).each do |category|
  x = [1,2].sample
  Post.create(name: category, user_id: x)
end

Post.all.each do |post|
  2.times do
    x = [1,2].sample
    comment = Comment.create(content: Faker::Lorem.paragraphs.join("\n\n"), user_id: x)
  end
end
