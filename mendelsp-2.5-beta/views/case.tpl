%include('header')
%include('navbar')

%if defined('status'):
    Status: {{status}}
%end

%include("navactions")

<!--
<form>
<select id="selector" onchange="show(this.value)">
<option value="Show output every...">
<option value="500">500ms
<option value="1000">1s
<option value="5000">5s
<option value="10000">10s
<option value="30000">30s
<option value="60000">1m
<option value="10000000000">&infin;
</select>
</form>
-->

<div id="output"></div>

<!-- <form name="nl" role="form">
  <div class="input-group col-xs-6" style="width:300px; padding-left:15px">
  <span class="input-group-addon">Number of lines to display</span>
  <input class="form-control" type="number" id="num_lines" min="10" max="100" value="24">
</form> -->

<script>
function show(update_interval) {
    showOutput = function() {
       // num_lines = document.nl.num_lines.value;
       url = '/{{app}}/{{cid}}/tail' //?num_lines='+num_lines
       jQuery('#output').load(url, function(){
          setTimeout(showOutput, update_interval);
          // slow down updates over time to relieve burden on server
          if (update_interval < 10000) {
              update_interval+=500;
          }
       })
    }
    //$("#selector").hide()
    showOutput();
}
show(1000);
</script>

%include('footer')
