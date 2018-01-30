class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.integer :html_score
      t.integer :css_score
      t.integer :javascript_score
      t.integer :python_score
      t.integer :django_score
      t.integer :ios_score
      t.integer :android_score

      t.timestamps null: false
    end
  end
end
