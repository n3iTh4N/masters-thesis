@ctr = 1
@level = 1
@question_per_level = 1

@qs = '
  {"names":[{"names":["Africa","America", "Asia", "Australia"]},"America", "Asia", "Australia"]}
'
# level => team => player_number
@eiqs = '
  {
    "1":
      [
        {
          "1":
          [
            {
              "1" :
              [
                {"1":"1", "2":"2"}
              ]
              ,
              "2" :
              [
                {"1":"3", "2":"4"}
              ]
              ,
              "3" :
              [
                {"1":"5", "2":"6"}
              ]
            }
          ]
        }
      ]
  }
'
@qsj = JSON.parse(@eiqs)

if data['from'] == "answer"
  alert(data['answer'])
  alert(data['verdict'])
  alert(data['z'])
  $("#questionPane").html("changed")

  answer: (response, key) ->
    @perform 'answer',
    answer: response,
    key: key

    <%= @qsj %>
    <br/>
    <%= @qsj['1'][0]['1'][0]['1'][0]['1'] %>
    <br/>
    <%= @qsj['1'][0]["#{current_student.team_id}"][0]["#{current_student.player_number}"][0]['1'] %>
    <br/>
    <%= Question.where(id: @qsj['1'][0]["#{current_student.team_id}"][0]["#{current_student.player_number}"][0]['1'])[0].content %>
    <br/>

    <div id="questionPane">
    <%=
      dq = @qsj["#{@level}"][0]["#{current_student.team_id}"][0]["#{current_student.player_number}"][0]["#{@ctr}"]
      Question.where(id: dq)[0].content
      @curr_ans = Question.where(id: dq)[0].answer
    %>
    </div>
