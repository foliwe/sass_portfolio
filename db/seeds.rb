# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |blog|

  Blog.create!(
    title:"My Blog Number#{blog}",
    body:"Offal locavore listicle lyft, deep v quinoa etsy vexillologist unicorn beard roof party gentrify mlkshk tilde. Drinking vinegar aesthetic skateboard, tote bag chia la croix viral glossier kinfolk subway tile bitters. Pug dreamcatcher hashtag fingerstache helvetica, drinking vinegar schlitz vegan health goth vexillologist lyft gluten-free artisan"
    )

end

9.times do |ptf_item|
  Portfolio.create!(
    title:"My Portfolio Number#{ptf_item}",
    subtitle:"subtitle#{ptf_item}",
    body:"Heirloom mustache crucifix, succulents air plant four dollar toast roof party kogi hot chicken tousled blue bottle. Beard before they sold out chia snackwave. Seitan XOXO succulents, thundercats pickled cronut lumbersexual gentrify bicycle rights hoodie craft beer banh mi. Chillwave franzen sriracha jean shorts unicorn sustainable, gochujang flexitarian offal farm-to-table.",
    main_image:"http://placehold.it/800x400",
    thumb_image:"http://placehold.it/350x150"
    )
  end

  5.times do |skill|
    Skill.create!(
      title: "Rails Version #{skill}",
      percentage: 15
      )
  end

  puts "10 Blog created"

  puts "9 Portfolios created"
  puts "5 skills created"