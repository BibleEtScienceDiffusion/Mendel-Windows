%include('header',title='confirm')
<body onload="init()">
%include('navbar')
%include('apps/alert')
<!-- This file was autogenerated from SciPaaS -->
<form action="/confirm" method="post">
<input type="hidden" name="app" value="{{app}}">
%if defined('cid'):
<input type="hidden" name="cid" value="{{cid}}">
%end
<input class="btn btn-success" type="submit" value="confirm" />

<div class="tab-pane" id="tab-pane-1">
<div class="tab-page">
<h2 class="tab">basic</h2>
<table><tbody>
<tr><td>case_id:</td>
	<td><input type="text" name="case_id" value="{{case_id}}"/></td></tr>
</tbody></table>
</div>

</div>
</form>
%include('footer')
