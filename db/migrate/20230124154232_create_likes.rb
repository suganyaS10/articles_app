class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.bigint :article_id, index: { unique: true }
      t.integer :likes_count, default: 0

      t.timestamps
    end
  end
end
