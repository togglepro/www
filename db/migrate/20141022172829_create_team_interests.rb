class CreateTeamInterests < ActiveRecord::Migration
  def change
    create_table :team_interests do |t|
      t.string :name
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
