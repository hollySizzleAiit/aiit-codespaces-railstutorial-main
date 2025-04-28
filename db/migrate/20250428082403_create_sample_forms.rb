class CreateSampleForms < ActiveRecord::Migration[7.0]
  def change
    create_table :sample_forms do |t|
      t.string :text
      t.string :password
      t.string :search
      t.string :tel
      t.string :url
      t.string :email
      t.integer :number
      t.integer :range
      t.string :color
      t.date :date
      t.datetime :datetime_local
      t.date :month
      t.date :week
      t.time :time
      t.boolean :checkbox
      t.string :radio
      t.string :file
      t.string :hidden

      t.timestamps
    end
  end
end
