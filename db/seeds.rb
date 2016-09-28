Student.create!([
  {first_name: nil, last_name: nil, player_number: 1, lobby_id: 1, device_id: nil, team_id: 1, playing: nil, teacher_id: nil, email: "a@gmail.com", encrypted_password: "$2a$11$Wsns2c.3tuva/bkVodHxC.wJfJoWZ889O9379dSiBDQP9R0bbLMyG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-09-28 04:29:18", last_sign_in_at: "2016-09-27 14:11:33", current_sign_in_ip: "::1", last_sign_in_ip: "::1", game_id: 1},
  {first_name: nil, last_name: nil, player_number: 2, lobby_id: 1, device_id: nil, team_id: 1, playing: nil, teacher_id: nil, email: "c@gmail.com", encrypted_password: "$2a$11$qONhin9oYXBHZeWMswO4z.uxZFvI/7APP.412aeYDSAkSPGHvfkZy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-09-27 16:39:25", last_sign_in_at: "2016-09-27 16:23:29", current_sign_in_ip: "::1", last_sign_in_ip: "::1", game_id: 1}
])
Game.create!([
  {name: "Estimate It!", number_of_teams: 3, players_per_team: 3, playing: false}
])
Link.create!([
  {game_id: 1, team_id: 1, player_number: 1, series: 1, question_id: 1, next: 2},
  {game_id: 1, team_id: 1, player_number: 1, series: 2, question_id: 2, next: 999},
  {game_id: 1, team_id: 1, player_number: 2, series: 1, question_id: 3, next: 2},
  {game_id: 1, team_id: 1, player_number: 2, series: 2, question_id: 4, next: 999}
])
Lobby.create!([
  {name: "NoobRoom2", teacher_id: 1, player_count: 0, game_id: 1, playing: false}
])
Question.create!([
  {content: "question x", answer: "x"},
  {content: "question r", answer: "r"},
  {content: "question j", answer: "j"},
  {content: "questiok j", answer: "k"},
  {content: "Congratulations!", answer: ""}
])
Teacher.create!([
  {first_name: "Neithan", last_name: "Casano"}
])
Team.create!([
  {name: "The Animation Squad", game_id: 1, lobby_id: 1},
  {name: "Nerdfighteria", game_id: 1, lobby_id: 1}
])
