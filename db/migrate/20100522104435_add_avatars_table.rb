class AddAvatarsTable < ActiveRecord::Migration
  def self.up
    create_table :avatars, :options => 'default charset=utf8' do |t|
      t.integer :user_id, :parent_id, :size, :width, :height
      t.string :content_type, :filename, :thumbnail
      t.timestamps
    end
  end

  def self.down
    drop_table :avatars
  end
end
