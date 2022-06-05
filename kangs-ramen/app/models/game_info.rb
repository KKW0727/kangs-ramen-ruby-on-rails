class GameInfo < ApplicationRecord
    has_one_attached :my_team_logo
    has_one_attached :opponent_team_logo
end
