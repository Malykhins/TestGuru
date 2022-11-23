# frozen_string_literal: true

categories = Category.create!([
                                { title: 'Ruby language' },
                                { title: 'Internet protocols' }
                              ])

tests = Test.create!([
                       { title: 'Ruby', level: 1, category_id: categories[0].id },
                       { title: 'Rails', level: 2, category_id: categories[0].id },
                       { title: 'HTML', level: 1, category_id: categories[1].id }
                     ])

questions = Question.create!([
                               { body: 'Who Invented the Ruby Language?', test_id: tests[0].id },
                               { body: 'In which file can gems be modified?', test_id: tests[1].id },
                               { body: 'What is an HTML tag?', test_id: tests[2].id }
                             ])

Answer.create!([
                 { body: 'Yukihiro Matsumoto', correct: true, question_id: questions[0].id },
                 { body: 'Rambo', correct: false, question_id: questions[0].id },
                 { body: 'Rubanov Vasily', correct: false, question_id: questions[0].id },
                 { body: 'Gemfile.lock', correct: false, question_id: questions[1].id },
                 { body: 'gems.rb', correct: false, question_id: questions[1].id },
                 { body: 'Gemfile', correct: true, question_id: questions[1].id },
                 { body: '**', correct: false, question_id: questions[2].id },
                 { body: '<>', correct: true, question_id: questions[2].id },
                 { body: '||', correct: false, question_id: questions[2].id }
               ])

User.create!([
               { name: 'Sergey', email: 'msa@mail.ru', test_id: tests[0].id },
               { name: 'Sergey', email: 'msa@mail.ru', test_id: tests[1].id },
               { name: 'Kirill', email: 'mks@mail.ru', test_id: tests[2].id }
             ])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
