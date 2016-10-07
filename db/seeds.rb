
Teacher.create(
	[
		{first_name: 'Neithan', last_name: 'Casano'}
	]
)

Student.create(
	[
		{
			first_name: 	'Jaiden',
			last_name: 		'Animations',
			player_number: 	1,
			lobby_id: 		1,
			device_id: 		1,
			team_id: 		1,
			playing: 		false,
			teacher_id: 	1
		}
	]
)

Student.create(
	[
		{
			first_name: 	'James',
			last_name: 		'TheOdd1sout',
			player_number: 	2,
			lobby_id: 		1,
			device_id: 		2,
			team_id: 		1,
			playing: 		false,
			teacher_id: 	1
		}
	]
)

Student.create(
	[
		{
			first_name: 	'Hank',
			last_name: 		'Green',
			player_number: 	1,
			lobby_id: 		1,
			device_id: 		3,
			team_id: 		2,
			playing: 		false,
			teacher_id: 	1
		}
	]
)

Student.create(
	[
		{
			first_name: 	'John',
			last_name: 		'Green',
			player_number: 	2,
			lobby_id: 		1,
			device_id: 		4,
			team_id: 		2,
			playing: 		false,
			teacher_id: 	1
		}
	]
)

Lobby.create(
	[
		{
			name: 			"NoobRoom2",
			teacher_id:  	1,
			player_count: 	0,
			game_id: 		1,
			playing:        false,
		}
	]
)

Game.create(
	[
		{
			name:   		"Estimate It!",
			number_of_teams: 3,
			players_per_team:     3,
			playing:    	 false
		}
	]
)

Team.create(
	[
		{
			name:   		"The Animation Squad",
			game_id:  		1,
			lobby_id:   	1
		}
	]
)

Team.create(
	[
		{
			name:   		"Nerdfighteria",
			game_id:  		1,
			lobby_id:   	1
		}
	]
)
