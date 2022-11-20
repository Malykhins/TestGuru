# frozen_string_literal: true

Test.create([{ title: 'Ruby', level: 1, category_id: 1, author_id: 1 },
             { title: 'Rails', level: 2, category_id: 1, author_id: 2 },
             { title: 'HTML', level: 1, category_id: 2, author_id: 1 }])

Question.create([{ body: 'Who Invented the Ruby Language?', test_id: 1 },
                 { body: 'In which file can gems be modified?', test_id: 2 },
                 { body: 'What is an HTML tag?', test_id: 3 }])

Answer.create([{ body: 'Yukihiro Matsumoto', correct: true, question_id: 1 },
               { body: 'gemfile.lock', correct: false, question_id: 2 },
               { body: '<>', correct: true, question_id: 3 }])

User.create([{ name: 'Sergey', email: 'msa@mail.ru' },
             { name: 'Kirill', email: 'mks@mail.ru' }])

Category.create([{ title: 'Ruby language' },
                 { title: 'Internet protocols' }])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
