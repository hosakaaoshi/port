class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.text :body
      t.text :image
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
