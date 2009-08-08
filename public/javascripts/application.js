$(document).ready(function(){
    $(".tweets").tweet({
        username: "hgimenez",
        join_text: "auto",
        avatar_size: 32,
        count: 4,
        //auto_join_text_default: "",
        //auto_join_text_ed: "",
        //auto_join_text_ing: "we were",
        //auto_join_text_reply: "I replied to",
        //auto_join_text_url: "we were checking out",
        join_text: false,
        loading_text: "loading tweets..."
    });

    apply_img_shadows();
    
});

function apply_img_shadows(){
 $(".post-body img").wrap("<div class='img-shadow'></div>");
 $(".img-shadow").after("<div class='clearfix'></div>");
}

