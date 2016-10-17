# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class TeacherChannel < ApplicationCable::Channel
  def subscribed
    stream_from "teacher_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def generateLayout (data)

    g = "<table>"
      for i in 1..data['teams'].to_i do
        g += "<tr>"
          g += "<td>"
            g += "TEAM #{i}"
          g += "</td>"
        g += "</tr>"
        for j in 1..data['ppteam'].to_i do
          g += "<tr>"
            g += "<td>"
              g += "Player #{j}"
            g += "</td>"
          g += "</tr>"
        end
      end
    g += "</table>"


    ActionCable.server.broadcast 'teacher_channel',
    generatedLayout: g
  end
end
