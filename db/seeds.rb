# frozen_string_literal: true

categories = Category.create!([
                                { title: 'Ruby language' },
                                { title: 'Internet protocols' }
                              ])
users = User.create!([
                       { name: 'Sergey', email: 'msa@mail.ru' },
                       { name: 'Kirill', email: 'mks@mail.ru' },
                       { name: 'Irina', email: 'mio@mail.ru' }
                     ])

tests = Test.create!([
                       { title: 'Ruby', level: 1, category: categories[0], author: users[0] },
                       { title: 'Rails', level: 2, category: categories[0], author: users[1] },
                       { title: 'HTML', level: 1, category: categories[1], author: users[2] }
                     ])

questions = Question.create!([
                               { body: 'Who Invented the Ruby Language?', test: tests[0] },
                               { body: 'Ruby is dead?', test: tests[0] },
                               { body: 'In which file can gems be modified?', test: tests[1] },
                               { body: 'What is an HTML tag?', test: tests[2] }
                             ])

Answer.create!([
                 { body: 'Yukihiro Matsumoto', correct: true, question: questions[0] },
                 { body: 'Rambo', correct: false, question: questions[0] },
                 { body: 'Rubanov Vasily', correct: false, question: questions[0] },
                 { body: 'True', correct: false, question: questions[1] },
                 { body: 'False', correct: true, question: questions[1] },
                 { body: 'Gemfile.lock', correct: false, question: questions[2] },
                 { body: 'gems.rb', correct: false, question: questions[2] },
                 { body: 'Gemfile', correct: true, question: questions[2] },
                 { body: '**', correct: false, question: questions[3] },
                 { body: '<>', correct: true, question: questions[3] },
                 { body: '||', correct: false, question: questions[3] }
               ])


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
