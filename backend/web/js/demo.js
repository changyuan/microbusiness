function displayResult(item, val, text) {
    var checkText = $('.btn-info').text();
    if(checkText.indexOf(text) < 0){
    	$('.select2-selection__rendered').show().append('<span style="display: inline-flex; margin-left: 3px;margin-bottom: 10px;" data="'+ val +'" class="btn btn-info">' + text + '<i onclick="removeItem(this)" class="select2-selection__choice__remove">x</i></span>');
    }
    $('#demo1').val("");
    addItem(val,text);
}

function removeItem(obj){
	$(obj).parent().remove();
    addVal();
}

function addItem(id,name){
    if($('#checkedTxt span').length >= 3){
        alert('单个直播只能添加三个标签!');
        return false;
    }
    var add = true;
    $('#checkedTxt span').each(function(){
        if($(this).attr('data') == id){
            add = false;
            return false;
        }
    });
    if(add){
        var html  = '<span style="display: inline-flex; margin-left: 3px;margin-bottom: 10px;" data="'+id+'" class="btn btn-info">'+name+'&nbsp;<i onclick="removeItem(this)" class="select2-selection__choice__remove">x</i></span>'
        $('#checkedTxt').append(html);
        addVal();
    }    
}

function addVal(){
    checkTextStr = "";
    $('#checkedTxt span').each(function(){
        if(checkTextStr == ""){
            checkTextStr += $(this).attr('data');
        }else{
            checkTextStr += ','+$(this).attr('data');
        }
    });
    $('#tagId').val(checkTextStr);
}
