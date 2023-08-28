$(document).ready(function () {
    $("#states").append($("<option>").text("-select state-"))
    $("#cities").append($("<option>").text("-select city-"))
    $("#universities").append($("<option>").text("-select university-"))
    $("#colleges").append($("<option>").text("-select college-"))
    $("#highschoolboards").append($("<option>").text("-select board-"))
    $("#highersecondaryboards").append($("<option>").text("-select board-"))
    $.getJSON("/resume/fetchallstates", function (data) {
        $.each(data, function (index, item) {
            $("#states").append($("<option>").text(item.statename).val(item.stateid))
        })
    })

    $("#states").change(function () {
        $("#highschoolboards").empty()
        $("#highersecondaryboards").empty()
        $("#highschoolboards").append($("<option>").text("-select board-"))
        $("#highersecondaryboards").append($("<option>").text("-select board-"))
    $.getJSON("/resume/fetchallboard", { stateid: $("#states").val() }, function (data) {
        $.each(data, function (index, item) {
            $("#highschoolboards").append($("<option>").text(item.boardname))
            $("#highersecondaryboards").append($("<option>").text(item.boardname))
        })
    })
})

    $("#states").change(function () {
        $("#cities").empty()
        $("#cities").append($("<option>").text("-select city-"))
        $.getJSON("/resume/fetchallcities", { stateid: $("#states").val() }, function (data) {
            $.each(data, function (index, item) {
                $("#cities").append($("<option>").text(item.cityname).val(item.cityid))
            })
        })
    })

    $("#states").change(function () {
        $("#universities").empty()
        $("#universities").append($("<option>").text("-select university-"))
        $.getJSON("/resume/fetchalluniversities", { stateid: $("#states").val() }, function (data) {
            $.each(data, function (index, item) {
                $("#universities").append($("<option>").text(item.universityname).val(item.universityid))
            })
        })
    })

    $("#universities").change(function () {
        $("#colleges").empty()
        $("#colleges").append($("<option>").text("-select college-"))
        $.getJSON("/resume/fetchallcolleges", { universityid: $("#universities").val() }, function (data) {
            $.each(data, function (index, item) {
                $("#colleges").append($("<option>").text(item.collegename).val(item.collegeid))
            })
        })
    })
})