# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class TeacherChannel < ApplicationCable::Channel
  def subscribed
    stream_from "teacher_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def generateLayout (data)

    g = "<table border='1px' width='100%'>"
      # generate team tr
      for i in 1..data['teams'].to_i do
        g += "<tr>"
          g += "<td colspan='" + (data['questions'].to_i + 1).to_s + "'>"
            g += "TEAM #{i}"
          g += "</td>"
        g += "</tr>"
        # generate rows per player that contains question boxes
        for j in 1..data['ppteam'].to_i do
          g += "<tr>"
            g += "<td width='10%'>"
              g += "Player #{j}"
              # generate question boxes
              g += "<div id='drop-area'>"
                # for k in 1..data['questions'].to_i do
                  # g += "<td>"
                  g += "<div>"
                    for k in 1..data['questions'].to_i do
                    g += "<div class='drop-area__item' title='hey' id=#{i.to_s+j.to_s+k.to_s} team=#{i} playernum=#{j} series=#{k} qid='0'></div>"
                    end
                  g += "</div>"
                  # g += "</td>"
                # end
              g += "</div>"
            g += "</td>"
          g += "</tr>"
        end
      end
    g += "</table>"


    ActionCable.server.broadcast 'teacher_channel',
    generatedLayout: g
  end
end
