<div class="container-fluid">
    <div class="col-md-12 col-lg-12">
        <div class="btn-group">
        <!-- <div class="btn-group" style="position:fixed; top:65px"> -->
            <form class="btn-group" action="/start" method="get">
                <button class="btn btn-default">
                    <span class="glyphicon glyphicon-repeat"></span> Restart
                </button>
                <input type="hidden" name="cid" value="{{cid}}">
                <input type="hidden" name="app" value="{{app}}">
            </form>
            <form class="btn-group" action="/case" method="get">
                <button class="btn btn-default"><span class="glyphicon glyphicon-hourglass">
                </span> Monitor</button>
                <input type="hidden" name="cid" value="{{cid}}">
                <input type="hidden" name="app" value="{{app}}">
            </form>
            <form class="btn-group" action="/files" method="get">
                <button class="btn btn-default">
                    <span class="glyphicon glyphicon-folder-open"></span> Files
                </button>
                <input type="hidden" name="cid" value="{{cid}}">
                <input type="hidden" name="app" value="{{app}}">
            </form>
            <form class="btn-group" action="/plot/0" method="get">
                <input type="hidden" name="cid" value="{{cid}}">
                <input type="hidden" name="app" value="{{app}}">
                <button class="btn btn-default">
                    <span class="glyphicon glyphicon-stats"></span> Plot
                </button>
            </form>
            <!--
            <form class="btn-group" action="/zipcase" method="get">
                <button class="btn btn-default">Zip</button>
                <input type="hidden" name="cid" value="{{cid}}">
                <input type="hidden" name="app" value="{{app}}">
            </form>
            -->
            <form class="btn-group" method="get" action="/inputs?cid={{cid}}&app={{app}}">
                <button class="btn btn-default">
                    <span class="glyphicon glyphicon-wrench"></span> Inputs</button>
                <input type="hidden" name="cid" value="{{cid}}">
                <input type="hidden" name="app" value="{{app}}">
            </form>
            <form class="btn-group" method="get" action="/output?cid={{cid}}&app={{app}}">
                <input type="hidden" name="cid" value="{{cid}}">
                <input type="hidden" name="app" value="{{app}}">
                <button class="btn btn-default"><span class="glyphicon glyphicon-file"></span> Output</button>
            </form>
            %if defined('plotpath'):  
            <form class="btn-group" role="form" action="/more" method="get">
                <input type="hidden" name="cid" value="{{cid}}">
                <input type="hidden" name="app" value="{{app}}">
                <input type="hidden" name="filepath" value="{{plotpath}}">
                <button class="btn btn-default"><span class="glyphicon glyphicon-list-alt"></span> Plot Data</button>
            </form>    
            %end            
            %if defined('jid'):
            %if jid > 0:
                <button type="button" class="btn btn-default" data-toggle="modal" 
                        data-target="#myModal">
                        <span class="glyphicon glyphicon-comment"></span> Label</button>
                <form class="btn-group" role="form" action="/jobs/stop" method="post">
                    <input type="hidden" name="cid" value="{{cid}}">
                    <input type="hidden" name="app" value="{{app}}">
                    <input type="hidden" name="jid" value="{{jid}}">
                    <button class="btn btn-default"><span class="glyphicon glyphicon-stop"></span> Stop</button>
                </form>  
                <button type="button" class="btn btn-default" data-toggle="modal" 
                        data-target="#dModal">
                        <span class="glyphicon glyphicon-trash"></span> Delete</button>                        
            %end
            %end
        </div>
    </div>
<!-- </div> -->




%if defined('jid'):
%if jid > 0: 
<!-- Delete Modal -->
<div class="modal fade" id="dModal" tabindex="-1" role="dialog" 
     aria-labelledby="deleteModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal" method="post" action="/jobs/delete/{{jid}}">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="deleteModal">Delete Case {{cid}}?</h4>
                    <input type="hidden" name="app" value="{{app}}">
                    <input type="hidden" name="cid" value="{{cid}}">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
%if defined('description'):
<!-- Label Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal" method="post" action="/jobs/annotate">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Enter labels for case separated by commas</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="app" value="{{app}}">
                    <input type="hidden" name="cid" value="{{cid}}">
                    <input type="hidden" name="jid" value="{{jid}}">
                    <input type="text" class="form-control" data-role="tagsinput"
                    name="description" value="{{description}}">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
%end
%end
%end




