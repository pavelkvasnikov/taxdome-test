# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Board.create!([
                  { name: 'New'     , link: 'uniq_link1'} ,
                  { name: 'Featured', link: 'uniq_link2'} ,
                  { name: 'Hot'     , link: 'uniq_link3'}
              ]
)

Article.create!([
                    {  name: 'test_column1', board_id: 1 },
                    {  name: 'test_column2', board_id: 1 },
                    {  name: 'test_column5', board_id: 1 },
                    {  name: 'test_column3', board_id: 2 },
                    {  name: 'test_column4', board_id: 3 },
                ]
)

Task.create!([
                    {  title: 'test_column1', article_id: 1 },
                    {  title: 'test_column2', article_id: 1 },
                    {  title: 'test_column5', article_id: 1 },
                    {  title: 'test_column3', article_id: 2 },
                    {  title: 'test_column4', article_id: 3 },
                ]
)
