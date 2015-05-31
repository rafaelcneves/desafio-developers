class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.float :html_score, default: 0
      t.float :css_score, default: 0
      t.float :javascript_score, default: 0
      t.float :python_score, default: 0
      t.float :django_score, default: 0
      t.float :ios_score, default: 0
      t.float :android_score, default: 0

      t.timestamps null: false
    end
  end
end
