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

  def submitLobby (data)
    ActionCable.server.broadcast 'lobby_channel',
    from: data['from']
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
    x: Student.find(data['student']).first_name, #previously e-mail
    # Send the edited data to update views
    y: Student.find(data['student']).as_json,
    from: "pickTeam"
  end

  def answer (data)
    # question_id: Link.where(game_id: data['game_id'], team_id: data['team_id'], player_number: data['player_number'], series: data['series'])
    qid = Link.where(game_id: data['game_id']).
                      where(team_id: data['team_id']).
                      where(player_number: data['player_number']).
                      where(series: data['series'])[0].question_id


    qprime = Link.where(game_id: data['game_id']).
                      where(team_id: data['team_id']).
                      where(player_number: data['player_number']).
                      where(series: data['series'])[0].next

    qnext = Link.where(game_id: data['game_id']).
                      where(team_id: data['team_id']).
                      where(player_number: data['player_number']).
                      where(series: qprime)[0].question_id

    qans = Question.find(qid).answer

    # find the total number of questions in game
    tqig = Game.find(data['game_id']).questioncount


    if data['answerText'].to_s == qans.to_s
      verdict = "correct"
    else
      verdict = "wrong"
    end

    if verdict == "correct"

      # update progress column in students table to be requeried after broadcast
      Student.where(id: data['studentCookie']).update_all(progress: Student.find(data['studentCookie']).progress+1)

      ActionCable.server.broadcast 'lobby_channel',
      question_id: qid,
      question_answer: qans,
      person_answer: data['answerText'],
      verdict: verdict,
      next: qprime,
      from: "correctanswer",
      student_cookie: data['studentCookie'],
      nextc: Question.find(qnext).content,
      qcount: tqig,
      cprogress: Student.find(data['studentCookie']).progress
    else
      ActionCable.server.broadcast 'lobby_channel',
      from: "wronganswer",
      student_cookie: data['studentCookie']
    end
  end

  def leave
  end
end
