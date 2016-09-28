Student.create!([
  {first_name: "neithan", last_name: "casano", player_number: 2, lobby_id: 1, device_id: nil, team_id: 1, playing: nil, teacher_id: 1, email: "a@gmail.com", encrypted_password: "$2a$11$Wsns2c.3tuva/bkVodHxC.wJfJoWZ889O9379dSiBDQP9R0bbLMyG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2016-09-28 06:19:03", last_sign_in_at: "2016-09-28 04:29:18", current_sign_in_ip: "::1", last_sign_in_ip: "::1", game_id: 1},
  {first_name: "jen", last_name: "agapito", player_number: 1, lobby_id: 1, device_id: nil, team_id: 1, playing: nil, teacher_id: 1, email: "c@gmail.com", encrypted_password: "$2a$11$qONhin9oYXBHZeWMswO4z.uxZFvI/7APP.412aeYDSAkSPGHvfkZy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2016-09-28 08:23:00", last_sign_in_at: "2016-09-27 16:39:25", current_sign_in_ip: "::1", last_sign_in_ip: "::1", game_id: 1}
])
Game.create!([
  {name: "Estimate It!", number_of_teams: 3, players_per_team: 3, playing: false},
  {name: "Tangrams Race", number_of_teams: 2, players_per_team: 3, playing: false}
])
Link.create!([
  {game_id: 1, team_id: 1, player_number: 1, series: 6, question_id: 999, next: nil},
  {game_id: 1, team_id: 1, player_number: 1, series: 1, question_id: 1, next: 2},
  {game_id: 1, team_id: 1, player_number: 1, series: 2, question_id: 4, next: 3},
  {game_id: 1, team_id: 1, player_number: 1, series: 3, question_id: 5, next: 4},
  {game_id: 1, team_id: 1, player_number: 1, series: 4, question_id: 8, next: 5},
  {game_id: 1, team_id: 1, player_number: 1, series: 5, question_id: 9, next: 6},
  {game_id: 1, team_id: 1, player_number: 2, series: 1, question_id: 2, next: 2},
  {game_id: 1, team_id: 1, player_number: 2, series: 6, question_id: 999, next: nil},
  {game_id: 1, team_id: 1, player_number: 2, series: 2, question_id: 4, next: 3},
  {game_id: 1, team_id: 1, player_number: 2, series: 3, question_id: 6, next: 4},
  {game_id: 1, team_id: 1, player_number: 2, series: 4, question_id: 8, next: 5},
  {game_id: 1, team_id: 1, player_number: 2, series: 5, question_id: 10, next: 6}
])
Lobby.create!([
  {name: "Here! Section ZT14  ", teacher_id: 1, player_count: 0, game_id: 1, playing: false}
])
Question.create!([
  {content: "question 1", answer: "1"},
  {content: "question 2", answer: "2"},
  {content: "question 3", answer: "3"},
  {content: "question 4", answer: "4"},
  {content: "question 5", answer: "5"},
  {content: "question 6", answer: "6"},
  {content: "question 7", answer: "7"},
  {content: "question 8", answer: "8"},
  {content: "question 9", answer: "9"},
  {content: "question 10", answer: "10"},
  {content: "question 11", answer: "11"},
  {content: "Congratulations!", answer: nil}
])
Teacher.create!([
  {first_name: "Felix", last_name: "Burgundy"}
])
