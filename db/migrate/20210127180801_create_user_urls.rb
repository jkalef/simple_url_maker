class CreateUserUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :user_urls do |t|
      t.string :long_url
      t.string :short_url
      
      t.timestamps
    end
  end
end
