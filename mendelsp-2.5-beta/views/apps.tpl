%include('header')
<style>
  .panel:hover {
    background-color: #dfdfdf !important;
  }
  a {
    text-decoration: none;
    color: #5f5f5f;
  }
</style>

<body>
%include('navbar')

<script>
// function delete(id) {
//    if(!confirm("Are you sure to delete?")) return                      
//       document.student_modify.action = "/apps/delete/id"
//       document.student_modify.submit()
//    }
// }
// function edit(id) {
//    if(!confirm("Are you sure to delete?")) return                      
//       document.student_modify.action = "/apps/delete/id"
//       document.student_modify.submit()
//    }
// }
</script>

<h1>Installed Apps</h1>

%# template to generate a HTML table from a list of tuples
%# from bottle documentation 0.12-dev p.53

<!--
<form method="get" action="/addapp">
   <input type="submit" class="submit add" value="add">
   <input type="submit" formaction="/apps/load" class="submit start" value="load">
</form>
-->

<div class="container-fluid">
  <div id="mypanel" class="panel-group">
    <div class="row">
      % for row in rows:
        <div class="panel panel-primary">
          <a style="text-decoration:none" href="/{{row['name']}}">
          <div class="panel-heading"><h2>{{row['name']}}</h2></div>
          <div class="panel-body"><h4>{{row['description']}}</h4></div>
          <div class="panel-footer">category: {{row['category']}}</div>
        </div>
        <!-- <a href="/{{row['name']}}"></a> -->
      <br>
      %end
    </div>
  </div>
</div>

%if configurable:
<div>
   <a href="/addapp" class="btn btn-default">
   <span class="glyphicon glyphicon-plus"></span> Add
   </a>
</div>
%end

%include('footer')
