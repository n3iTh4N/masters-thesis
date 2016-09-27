# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class LobbyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lobby_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def enter (data)
    ActionCable.server.broadcast 'lobby_channel', data['student']
  end

  def pickTeam (data)
    # Edit the student's team number and player number
    Student.where(id: data['student']).update_all(team_id: data['i'])
    Student.where(id: data['student']).update_all(player_number: data['j'])
    # Student.where(id: data['student']).update_all(lobby_id: current_student.lobby_id)

    # ActionCable.server.broadcast 'lobby_channel', "#{data['teamButton']} and #{data['student']}"
    ActionCable.server.broadcast 'lobby_channel',
    teamButton: data['teamButton'],
    student: data['student'],
    i: data['i'],
    j: data['j'],
    x: Student.find(data['student']).email,
    # Send the edited data to update views
    y: Student.find(data['student']).as_json,
    from: "pickTeam"
  end

  def answer (data)
    # question_id: Link.where(game_id: data['game_id'], team_id: data['team_id'], player_number: data['player_number'], series: data['series'])
    ActionCable.server.broadcast 'lobby_channel',
    question_id: Link.where(game_id: data['game_id']).
                      where(team_id: data['team_id']).
                      where(player_number: data['player_number']).
                      where(series: data['series'])[0].id,

    from: "answer"
  end

  def leave
  end
end
