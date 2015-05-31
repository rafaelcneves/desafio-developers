class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.float :html_score
      t.float :css_score
      t.float :javascript_score
      t.float :python_score
      t.float :django_score
      t.float :ios_score
      t.float :android_score

      t.timestamps null: false
    end
  end
end
