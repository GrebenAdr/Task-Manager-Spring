$(document).ready(function () {

    $('#saveTask').submit(function (e) {

        $.post('/task-manager/task/save', $(this).serialize(), function(task) {
            $('#taskTableResponse').last().append(
                '<tr>' +
                    '<td>' + task.id + '</td>' +
                    '<td>' + task.taskName + '</td>' +
                    '<td>' + task.taskDescription + '</td>' +
                    '<td>' + task.taskDate + '</td>' +
                    '<td>' + task.taskTime + '</td>' +
                    '<td>' + task.taskContacts + '</td>' +
                '</tr>'
            );
        });

        clearInputs();

        e.preventDefault();
    });

});

function clearInputs() {
    $('input[id*="Input"]').each(function () {
        $(this).val('');
    });
}

$(document).ready(function () {
    $('#button').click(function () {

        var tName = $('#tNameInput').val();
        var tDescription = $('#tDescriptionInput').val();

        $.ajax({
            type:'GET',
            url:"/task-manager/task/getJSON/" + tName + "/" + tDescription,
            dataType:'json',
            success:function (result) {

                var task =
                    "id : " + result.id +
                    " | name : " + result.taskName + 
                    " | description :" + result.taskDescription +
                    " | date : " + result.taskDate +
                    " | time : " + result.taskTime +
                    " | contacts : " + result.taskContacts;

                $("#theJson").html(task);
                
                clearInputs();

            },
            error:function (jqXHR, textStatus, errorThrown) {
                alert("Task " + textStatus + " " + errorThrown + " !");
            }

        });
    });
});

$(document).ready(function () {
    $('#search').keyup(function (e) {
        var filter = $('#search').val();
        if (filter.length > 0) {
            loadTable(filter);
        } else {
            $('tr[id*="tr_"]').remove();
        }
    });
});

function loadTable(filter) {
    var url = "/task-manager/task/load/" + filter;

    $('#tbody').load(url, function (response, status, xhr) {
        if (status == "error") {
            var msg = "Sorry but there was an error: ";
            $("#info").html(msg + xhr.status + " " + xhr.statusText);
        }
    });

    return false;
}


