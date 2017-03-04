$(document).ready(function () {
    // var userName = $('#user_name').text();
    userName = "Aya";

    //cross clicked 
    $('.remove_tag').click(function () {
        $(this).parent().parent().fadeOut("slow");
        console.log("clicked!")
    });

    $('#btn_add_tag').click(function () {
        var tag = $('#tag_input').val();
        console.log(tag);
        if (tag === undefined || tag === '') {
            return;
        }
        if (!checkTag(tag)) {
            return;
        }



        $.ajax({
            type: "POST",
            url: "http://localhost:15276/WebSite1/Services/WebService.asmx/AddUserTag",
            //     dataType: "application/json; charset=utf-8",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ 'userName': userName, 'tag': tag }),
            processData: false
        }).done(function (data, status, jqXHR) {
            console.log("success");
            var tagElement = '<div style="display:inline-block;margin:5px;">';
            tagElement += '<span class="tag tag-default"> <span>' + tag + '</span>';
            tagElement += '<span class="glyphicon glyphicon-remove remove_tag"></span></span></div>';

            $(tagElement).appendTo('#pnlTags').fadeIn('slow');
        });

        return false;
    });

});

function checkTag(tag)
{
    var valid = true;
    $('.tag.tag-default > span').each(function () {
        var temp = $(this).text();
        if (tag === temp) {
            $('#btn_add_tag').popover(
                    { title: "Caution",
                        content: "You have already followed tag " + tag ,
                        animation: true,
                        container:'div#tags.tab-pane',
                        delay: { show: 1000, hide: 300 },
                        trigger: "manual"
                    });


            $('#btn_add_tag').popover("show");
            setTimeout(function () { $('#btn_add_tag').popover("destroy") }, 3000);

            valid = false;
        }
    });

    return valid;
}