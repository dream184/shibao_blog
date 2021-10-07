class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :categories
      t.string :tag

      t.timestamps
    end
  end
end
