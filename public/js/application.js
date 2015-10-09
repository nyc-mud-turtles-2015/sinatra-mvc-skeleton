$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $("#post").on("click", "a", function(e){
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: $(this).attr("href"),
      data: $(this).serialize(),
      success: function(data2, textStatus, jqXHR){
        href = "a[href$=\'" + $(this)[0].url + "\']";
        $(href).append("+");
        debugger;
      },
      error: function(jqXHR, textStatus, errorThrown){
        href = "a[href$=\'" + $(this)[0].url + "\']";
        var str = $(href).text().replace(/\+/, '');
        $(href).text(str)
        debugger;
      }
    });
  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
