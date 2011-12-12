<div id="lastPoll">Last poll: <span><?php echo date('Y-m-d H:i:s'); ?></span></div>
<div id="status">Poll Status: <span>initializing...</span></div>

<script type="text/javascript">
var 

Poller = {}
Poller.datetime = $('#lastPoll span').text();
Poller.delay = 2;

Poller.getNextPoll = function( data ) {
    Poller.active = true;
    $('#status').html('polling');
    $.getJSON(
        '/public/get_poll', 
        { 'last_request' : Poller.datetime },
        function(data) {
            Poller.datetime = data.server_time 
            $('#lastPoll').html( 'Current Time: <strong>' + data.server_time + '</strong>. Previous request sent: <strong>' + data.last_request + '</strong>');
            $('#status').html('waiting');
        }
    );
        
    this.timeout = setTimeout(function(){Poller.getNextPoll();}, Poller.delay * 1000 );
}

Poller.endWait = function(){
    clearTimeout( this.timeout );
}

//kick it off after 2 seconds
Poller.timeout = setTimeout( function(){Poller.getNextPoll();}, Poller.delay * 1000  );

$(function(){
    $('#kill').bind('click', function(){
        Poller.endWait();
        Poller.active = false;
        $('#status').html('stopped');
    })
})

//stop
$(function(){
    $('#kill').bind('click', function(){
        Poller.endWait();
        Poller.active = false;
        $('#status').html('stopped');
    })
});

//resume
$(function(){
    $('#startPolling').bind('click', function(){
        if( !Poller.active ) {
            Poller.getNextPoll();
        }
    })
})

</script>

<span id="kill">
    stop polling
</span>
<span id="startPolling">
    start polling
</span>