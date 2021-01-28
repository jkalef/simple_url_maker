class CreateUrlStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :url_statistics do |t|
      t.references :user_url, null: false, foreign_key: true
      t.string :visit_ip_address

      t.timestamps
    end
  end
end
