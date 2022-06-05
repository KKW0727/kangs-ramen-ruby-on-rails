class CreateGameInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :game_infos do |t|
      t.string :my_team_logo
      t.string :opponent_team_logo
      t.integer :my_team_score
      t.integer :opponent_team_score

      t.timestamps
    end
  end
end
